import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DBUtils {
  static Future init() async {
    var database = openDatabase(
      path.join(await getDatabasesPath(), 'schedule_items.db'),
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE schedule_items('
          'id TEXT PRIMARY KEY,'
          'title TEXT NOT NULL,'
          'departure TEXT NOT NULL,'
          'destination TEXT NOT NULL,'
          'preference TEXT NOT NULL,'
          'hour INTEGER NOT NULL,'
          'minute INTEGER NOT NULL'
          ')',
        );
      },
      version: 1,
    );
    return database;
  }
}

  // String? id;
  // String? title;
  // String? departure;
  // String? destination;
  // String? preference;
  // int? hour;
  // int? minute;
