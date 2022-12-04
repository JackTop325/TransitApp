import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'db_utils.dart';
import 'schedule.dart';

class ScheduleModel {
  Future insertSchedule(Schedule schedule) async {
    final db = await DBUtils.init();
    return db.insert(
      'schedule_items',
      schedule.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future getAllSchedules() async {
    final db = await DBUtils.init();
    final List<Map<String, dynamic>> maps = await db.query('schedule_items');
    List<Schedule> result = [];
    if (maps.isNotEmpty) {
      for (int i = 0; i < maps.length; i++) {
        result.add(Schedule.fromMap(maps[i]));
      }
    }
    return result;
  }

  Future updateSchedule(Schedule schedule) async {
    final db = await DBUtils.init();
    await db.update(
      'grade_items',
      schedule.toMap(),
      where: 'id = ?',
      whereArgs: [schedule.id],
    );
  }

  Future deleteScheduleWithId(String id) async {
    final db = await DBUtils.init();
    await db.delete(
      'schedule_items',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
