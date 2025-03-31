import 'dart:convert';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:time_capsule/db_capsule/capsule_entity.dart';


class DBCapsule extends GetxService {
  late Database dbBase;

  Future<DBCapsule> init() async {
    await createCapsuleDB();
    return this;
  }

  createCapsuleDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'capsule.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createCapsuleTable(db);
          await createCapsuleItemTable(db);
        });
  }

  createCapsuleTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS capsule (id INTEGER PRIMARY KEY, createdTime TEXT, title TEXT, list TEXT)');
  }

  createCapsuleItemTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS capsuleItem (id INTEGER PRIMARY KEY, createdTime TEXT, entity TEXT, startTime TEXT, endTime TEXT, content TEXT)');
  }

  insertCapsule(CapsuleEntity entity) async {
    final id = await dbBase.insert('capsule', {
      'createdTime': entity.createdTime.toIso8601String(),
      'title': entity.title,
    });
    return id;
  }

  insertCapsuleItem(CapsuleItem item) async {
    final id = await dbBase.insert('capsuleItem', {
      'createdTime': item.entity.createdTime.toIso8601String(),
      'entity': jsonEncode(item.entity.toJson()),
      'startTime': item.startTime.toIso8601String(),
      'endTime': item.endTime.toIso8601String(),
      'content': item.content,
    });
    return id;
  }

  cleanCapsuleData() async {
    await dbBase.delete('capsule');
    await dbBase.delete('capsuleItem');
  }

  Future<List<CapsuleEntity>> getCapsuleAllData() async {
    var result = await dbBase.query('capsule', orderBy: 'createdTime DESC');
    return result.map((e) => CapsuleEntity.fromJson(e)).toList();
  }

  Future<List<CapsuleItem>> getCapsuleItemAllData() async {
    var result = await dbBase.query('capsuleItem', orderBy: 'createdTime DESC');
    return result.map((e) => CapsuleItem.fromJson(e)).toList();
  }
}
