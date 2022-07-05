import 'package:floor/floor.dart';
import 'package:sshclient/entity/config.dart';

@dao
abstract class ConfigDao {
  @Query('SELECT * FROM ff_config')
  Future<List<ConfigEntity>> findAllConfigs();

  @Query('SELECT * FROM ff_config WHERE id = :id')
  Future<ConfigEntity?> findConfigById(int id);

  @Query('SELECT * FROM ff_config WHERE tag = :tag')
  Future<ConfigEntity?> findConfigByTag(String tag);

  @insert
  Future<void> insertConfig(ConfigEntity config);

  @insert
  Future<List<int>> insertConfigs(List<ConfigEntity> configs);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<int> updateConfig(ConfigEntity config);

  @update
  Future<int> updateConfigs(List<ConfigEntity> configs);
}
