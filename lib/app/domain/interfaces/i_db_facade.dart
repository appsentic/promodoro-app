import 'package:dartz/dartz.dart';

/// [T] will be the data type
/// [U] will be the error type
abstract class IDBFacade<U, T> {
  Future<Either<U, bool>> create({
    required String tableName,
    required Map<String, dynamic> data,
  });

  Future<Either<U, bool>> createMany({
    required String tableName,
    required List<Map<String, dynamic>> data,
  });

  Future<Either<U, T?>> find({
    required String tableName,
    required String id,
  });

  Future<Either<U, List<T>?>> findAll({
    required String tableName,
    List<String>? ids,
  });

  Future<Either<U, bool>> remove({
    required String tableName,
    required String id,
  });

  Future<Either<U, bool?>> update({
    required String tableName,
    required String id,
    required Map<String, dynamic> data,
  });
}
