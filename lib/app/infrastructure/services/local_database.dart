import 'package:path/path.dart';
import 'package:promodoro/app/domain/constant/strings.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  final Database database;
  static LocalDatabase? _instance;

  LocalDatabase._(this.database);

  static Future<LocalDatabase> get instance => initializeDb();

  static Future<LocalDatabase> initializeDb() async {
    return _instance ??= LocalDatabase._(await _initDb());
  }

  static Future<Database> _initDb({int version = 1}) async {
    // Get a location using getDatabasesPath
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, AppStrings.dbName);

    Database db = await openDatabase(
      path,
      onCreate: (Database _db, int _version) {
        _db.execute('''
          CREATE TABLE ${AppStrings.projectsTableName} (
            id INTEGER PRIMARY KEY, 
            name TEXT, 
            description TEXT,
            minutesPerSession INTEGER,
            focusSessions INTEGER,
            shortBreakLength INTEGER,
            longBreakLength INTEGER,
            isCompleted INTEGER,
            shouldNotify INTEGER
          );
        ''');
      },
      version: version,
    );

    return db;
  }
}
