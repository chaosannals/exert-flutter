import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dao/config_dao.dart';
import 'entity/config.dart';

part 'database.g.dart';

@Database(version: 1, entities: [ConfigEntity])
abstract class AppDatabase extends FloorDatabase {
  ConfigDao get configDao;
}
