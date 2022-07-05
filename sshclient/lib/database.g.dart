// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ConfigDao? _configDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ff_config` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `tag` TEXT NOT NULL, `content` TEXT NOT NULL, `create_at` TEXT NOT NULL, `update_at` TEXT)');
        await database.execute(
            'CREATE UNIQUE INDEX `index_ff_config_tag` ON `ff_config` (`tag`)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ConfigDao get configDao {
    return _configDaoInstance ??= _$ConfigDao(database, changeListener);
  }
}

class _$ConfigDao extends ConfigDao {
  _$ConfigDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _configEntityInsertionAdapter = InsertionAdapter(
            database,
            'ff_config',
            (ConfigEntity item) => <String, Object?>{
                  'id': item.id,
                  'tag': item.tag,
                  'content': item.value,
                  'create_at': item.createAt,
                  'update_at': item.updateAt
                }),
        _configEntityUpdateAdapter = UpdateAdapter(
            database,
            'ff_config',
            ['id'],
            (ConfigEntity item) => <String, Object?>{
                  'id': item.id,
                  'tag': item.tag,
                  'content': item.value,
                  'create_at': item.createAt,
                  'update_at': item.updateAt
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ConfigEntity> _configEntityInsertionAdapter;

  final UpdateAdapter<ConfigEntity> _configEntityUpdateAdapter;

  @override
  Future<List<ConfigEntity>> findAllConfigs() async {
    return _queryAdapter.queryList('SELECT * FROM ff_config',
        mapper: (Map<String, Object?> row) => ConfigEntity(
            row['id'] as int, row['tag'] as String, row['content'] as String,
            createAt: row['create_at'] as String?,
            updateAt: row['update_at'] as String?));
  }

  @override
  Future<ConfigEntity?> findConfigById(int id) async {
    return _queryAdapter.query('SELECT * FROM ff_config WHERE id = ?1',
        mapper: (Map<String, Object?> row) => ConfigEntity(
            row['id'] as int, row['tag'] as String, row['content'] as String,
            createAt: row['create_at'] as String?,
            updateAt: row['update_at'] as String?),
        arguments: [id]);
  }

  @override
  Future<ConfigEntity?> findConfigByTag(String tag) async {
    return _queryAdapter.query('SELECT * FROM ff_config WHERE tag = ?1',
        mapper: (Map<String, Object?> row) => ConfigEntity(
            row['id'] as int, row['tag'] as String, row['content'] as String,
            createAt: row['create_at'] as String?,
            updateAt: row['update_at'] as String?),
        arguments: [tag]);
  }

  @override
  Future<void> insertConfig(ConfigEntity config) async {
    await _configEntityInsertionAdapter.insert(
        config, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertConfigs(List<ConfigEntity> configs) {
    return _configEntityInsertionAdapter.insertListAndReturnIds(
        configs, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateConfig(ConfigEntity config) {
    return _configEntityUpdateAdapter.updateAndReturnChangedRows(
        config, OnConflictStrategy.replace);
  }

  @override
  Future<int> updateConfigs(List<ConfigEntity> configs) {
    return _configEntityUpdateAdapter.updateListAndReturnChangedRows(
        configs, OnConflictStrategy.abort);
  }
}
