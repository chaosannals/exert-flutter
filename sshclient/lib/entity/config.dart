import 'package:floor/floor.dart';

@Entity(
  tableName: 'ff_config',
  indices: [
    Index(
      value: ['tag'],
      unique: true,
    ),
  ],
)
class ConfigEntity {
  @PrimaryKey(autoGenerate: true)
  final int id;

  @ColumnInfo(name: 'tag')
  String? tag;

  @ColumnInfo(name: 'host')
  String host;

  @ColumnInfo(name: 'port')
  String port;

  @ColumnInfo(name: 'account')
  String account;

  @ColumnInfo(name: 'password')
  String password;

  @ColumnInfo(name: 'create_at')
  final String createAt;

  @ColumnInfo(name: 'update_at')
  String? updateAt;

  ConfigEntity(
    this.id, {
    String? tag,
    String? host,
    String? port,
    String? account,
    String? password,
    String? createAt,
    String? updateAt,
  })  : tag = tag,
        host = host ?? '',
        port = port ?? '',
        account = account ?? '',
        password = password ?? '',
        createAt = createAt ?? DateTime.now().toString(),
        updateAt = updateAt ?? createAt;
}
