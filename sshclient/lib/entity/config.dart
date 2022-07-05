import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';

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
  final String tag;

  @ColumnInfo(name: 'content')
  final String value;

  @ColumnInfo(name: 'create_at')
  final String createAt;

  @ColumnInfo(name: 'update_at')
  final String? updateAt;

  ConfigEntity(
    this.id,
    this.tag,
    this.value, {
    String? createAt,
    String? updateAt,
  })  : createAt = createAt ?? DateTime.now().toString(),
        updateAt = updateAt ?? createAt ?? DateTime.now().toString();
}
