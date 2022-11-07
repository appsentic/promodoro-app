import 'dart:developer';

import 'package:promodoro/app/application/store/states/app_state.dart';
import 'package:promodoro/app/domain/interfaces/i_db_interface.dart';
import 'package:sqflite/sql.dart';

class AppDatabase extends IDBInterface<AppState> {
  AppDatabase({
    required this.currentAppState,
  });

  final AppState currentAppState;

  @override
  List<String> get columns => super.columns;

  @override
  Future<AppState> readData({int? version}) async {
    List<String> columns =
        currentAppState.toJson().keys.map((String column) => column).toList();

    List<Map<String, Object?>> mapData = await database.query(
      tableName,
      where: 'id = ?',
      whereArgs: <dynamic>['1'],
      columns: columns,
      limit: 1,
    );

    log('Initial data from db: ${await database.rawQuery('SELECT * FROM $tableName')}');

    if (mapData.isEmpty) {
      return AppState.initial();
    }

    AppState _appState = toAppState(mapData.first);

    return _appState;
  }

  @override
  void saveData(AppState data, {int? version}) async {
    await database.insert(
      tableName,
      data.toMap(),
    );

    log('After Save: ${await database.rawQuery('SELECT * FROM $tableName')}');
  }

  @override
  void updateData(AppState data, {int? version}) async {
    try {
      int count = await database.update(
        tableName,
        data.toMap(),
        where: 'id = ?',
        whereArgs: <dynamic>['1'],
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      log('Update count: $count');
    } catch (e) {
      log('Error while updating db: $e');
    }

    log('After Update: ${await database.rawQuery('SELECT * FROM $tableName')}');
  }
}
