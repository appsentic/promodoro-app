import 'package:dartz/dartz.dart';
import 'package:promodoro/app/domain/core/entities/errors/system_error.dart';
import 'package:promodoro/app/domain/core/entities/project/project_entity.dart';
import 'package:promodoro/app/domain/interfaces/i_db_facade.dart';
import 'package:promodoro/app/infrastructure/services/local_database.dart';
import 'package:sqflite/sqflite.dart';

class LocalProjectsDB implements IDBFacade<SystemError, ProjectEntity> {
  LocalProjectsDB({
    required this.localDatabase,
  });

  final LocalDatabase localDatabase;

  @override
  Future<Either<SystemError, bool>> create({
    required String tableName,
    required Map<String, dynamic> data,
  }) async {
    try {
      final int res = await localDatabase.database.insert(
        tableName,
        data,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      return right(res == 0);
    } catch (e) {
      return left(
        SystemError(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<SystemError, bool>> createMany({
    required String tableName,
    required List<Map<String, dynamic>> data,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<SystemError, ProjectEntity?>> find({
    required String tableName,
    required String id,
  }) async {
    try {
      final List<Map<String, Object?>> res = await localDatabase.database.query(
        tableName,
        where: 'id = ?',
        whereArgs: <dynamic>[id],
        limit: 1,
      );

      if (res.isEmpty) {
        return right(null);
      }

      final Map<String, Object?> first = res.first;
      final ProjectEntity project = ProjectEntity.fromJson(first);
      return right(project);
    } catch (e) {
      return left(
        SystemError(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<SystemError, List<ProjectEntity>?>> findAll({
    required String tableName,
    List<String>? ids,
  }) async {
    try {
      final List<Map<String, Object?>> res = await localDatabase.database.query(
        tableName,
      );

      if (res.isEmpty) {
        return right(null);
      }

      late List<ProjectEntity> projects = <ProjectEntity>[];
      res.forEach((Map<String, Object?> item) {
        projects.add(ProjectEntity.fromJson(item));
      });

      return right(projects);
    } catch (e) {
      return left(
        SystemError(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<SystemError, bool>> remove({
    required String tableName,
    required String id,
  }) async {
    try {
      final int res = await localDatabase.database.delete(
        tableName,
        where: 'id = ?',
        whereArgs: <dynamic>[id],
      );

      return right(res == 0);
    } catch (e) {
      return left(
        SystemError(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<SystemError, bool>> update({
    required String tableName,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    try {
      final int res = await localDatabase.database.update(
        tableName,
        data,
        where: 'id = ?',
        whereArgs: <dynamic>[id],
      );

      return right(res == 0);
    } catch (e) {
      return left(
        SystemError(
          message: e.toString(),
        ),
      );
    }
  }
}
