import 'package:path/path.dart';
//import 'package:sqflite/sqflite.dart';

///缓存数据库名字
const String dbName = "data.db";

///缓存表名字
final String tableCache = "table_cache";

///字段
final String columnId = "id";
final String columnKey = "key";
final String columnValue = "value";
final String columnTime = "time";

class CacheObject {
  int id;
  String key;
  String value;
  int time;

  CacheObject({this.id, this.key, this.value, this.time});

  CacheObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    value = json['value'] ?? "";
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['key'] = this.key;
    data['value'] = this.value;
    data['time'] = this.time;
    return data;
  }
}

class CacheDataProvider {
//  Database _db;

  ///操作db之前必须保证db是打开的
  Future _open({String name = dbName}) async {
//    if (_db == null || !_db.isOpen) {
//      var databasesPath = await getDatabasesPath();
//      String path = join(databasesPath, name);
//      _db = await openDatabase(path, version: 1,
//          onCreate: (Database db, int version) async {
//            await db.execute('''
//create table $tableCache (
//  $columnId integer primary key autoincrement,
//  $columnKey text not null,
//  $columnValue text DEFAULT '{}',
//  $columnTime integer not null,
//  UNIQUE($columnKey)
//  )
//''');
//          });
//    }
  }

  ///设置待缓存对象，如果key重复，会直接替换
  Future<CacheObject> set(CacheObject cacheObject) async {
    await _open();
//    List<Map> maps = await _db.query(tableCache,
//        columns: [columnKey, columnValue],
//        where: "$columnKey = ?",
//        whereArgs: [cacheObject.key]);
//    if (maps.length > 0) {
//      int count = await _db.rawUpdate(
//          'UPDATE $tableCache SET $columnValue = ?, $columnTime = ? WHERE $columnKey = ?',
//          [
//            cacheObject.value,
//            new DateTime.now().millisecondsSinceEpoch ~/ 1000,
//            cacheObject.key
//          ]);
//      print("updated: $count");
//    } else {
//      cacheObject.id = await _db.execute('''
//    INSERT  INTO $tableCache($columnKey,$columnValue,$columnTime)
//VALUES('${cacheObject.key}','${cacheObject.value}',strftime('%s','now'));
//    ''');
//    }
    return cacheObject;
  }

  ///取到缓存中的对象
  Future<CacheObject> get(String key) async {
    await _open();
//    List<Map> maps = await _db.query(tableCache,
//        columns: [columnKey, columnValue],
//        where: "$columnKey = ?",
//        whereArgs: [key]);
//    if (maps.length > 0) {
//      return new CacheObject.fromJson(maps.first);
//    }
    return null;
  }

  ///取到缓存中的对象
  Future<List<CacheObject>> getAll() async {
    await _open();
//    List<Map> maps = await _db.query(tableCache);
//    if (maps.length > 0) {
//      return maps.map((json) => CacheObject.fromJson(json)).toList();
//    }
    return List();
  }

  ///简单的替换一下lru策略
  Future lru() async {
    await _open();
//    List<Map> maps = await _db.query(tableCache);
//    if (maps.length > 100) {
//      var time = CacheObject.fromJson(maps[100]).time;
//      return _db
//          .delete(tableCache, where: "$columnTime <= ?", whereArgs: [time]);
//    }
  }

  ///整个清理
//  Future<int> clear() async {
//    await _open();
//    return await _db.delete(tableCache);
//  }

//  Future close() async => _db.close();
}