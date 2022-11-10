import 'dart:async';
import 'db_init.dart';
import 'bus_route.dart';
import 'package:sqflite/sqflite.dart';

class ScheduledRouteModel {

  Future testRouteModel() async{
    final scheduledDB = await DBInit.init();
  }

  Future getScheduledRoutes() async{
    final scheduledDB = await DBInit.init();
    final List maps = await scheduledDB.query('scheduled_routes');
    List resultData = [];
    for (int i = 0; i < maps.length; i++) {
      resultData.add(
          BusRoute.fromMap(maps[i])
      );
    }
    return resultData;
  }

  Future<int> insertScheduledRoute(BusRoute route) async{
    final scheduledDB = await DBInit.init();
    return scheduledDB.insert(
      'scheduled_routes',
      route.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  Future<int> updateScheduledRoute(BusRoute route) async{
    final scheduledDB = await DBInit.init();
    return scheduledDB.update(
      'scheduled_routes',
      route.toMap(),
      where: 'id = ?',
      whereArgs: [route.id],
    );
  }


  Future<int> deleteScheduledRoute(int id) async{
    final scheduledDB = await DBInit.init();
    return scheduledDB.delete(
      'scheduled_routes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }


}