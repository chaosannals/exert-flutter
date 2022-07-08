import 'package:sshclient/database.dart';
import 'package:sshclient/entity/config.dart';

Future<ConfigEntity> getConfig() async {
  final db = await $FloorAppDatabase.databaseBuilder('sshclient.db').build();
  final configDao = db.configDao;

  var config = await configDao.findConfigById(1);
  if (config == null) {
    config = ConfigEntity(1);
    await configDao.insertConfig(config);
  }
  return config;
}
