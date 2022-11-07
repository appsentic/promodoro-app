import 'package:path/path.dart';
import 'package:promodoro/app/domain/constant/db_migrations.dart';
import 'package:sqflite/sqflite.dart';

abstract class IDBOperations<T> {
  IDBOperations({
    this.dbName = 'promodoroTimerDB',
    this.tableName = 'appStateTable',
  });

  final String dbName;
  final String tableName;
  late Database database;
  List<String> columns = <String>[];

  Future<void> init(List<String> columnList) async {
    columns = columnList;
    // Get a location using getDatabasesPath
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);

    // wait for database initialization
    database = await openDatabase(
      path,
      onCreate: _onCreate,
      onUpgrade: _onUpGrade,
      onDowngrade: _onDownGrade,
      version: 1,
    );
  }

  void _onCreate(Database db, int version) {
    db.execute(_initAll());
  }

  void _onUpGrade(Database db, int current, int newVersion) {
    db.execute(_initAll());
  }

  void _onDownGrade(Database db, int current, int newVersion) {
    db.execute(_initAll());
  }

  //initialize all the columns and tables
  String _initAll() {
    return initColumns(tableName: tableName, columns: columns);
  }
}
