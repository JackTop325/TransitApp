import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

// TODO: DateTime data should be stored either int (UNIX Time) or String?

class DBInit {
  static Future init() async {
    var database = openDatabase(
      path.join(await getDatabasesPath(), 'stored_routes.db'),
      onCreate: (db, version) {
        db.execute("CREATE TABLE scheduled_routes(id TEXT PRIMARY KEY NOT NULL,"
            "hasNotification INTEGER NOT NULL,"
            "departureTime TEXT NOT NULL,"
            "notifyPeriod INTEGER,"
            "repeatRoute INTEGER NOT NULL,"
            "routeNumber TEXT NOT NULL,"
            "routeName TEXT NOT NULL,"
            "arrivalLocation TEXT NOT NULL,"
            "destination TEXT NOT NULL,"
            "arrivalTime TEXT NOT NULL)");
      },
      version: 1,
    );
    // TODO: Remove this line in final product
    // ignore: avoid_print
    print('Scheduled Routes ($database) initialized');
    return database;
  }
}
