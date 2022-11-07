import 'package:promodoro/app/domain/interfaces/i_db_operations.dart';

abstract class IDBInterface<T> extends IDBOperations<T> {
  Future<T?> readData({int? version});
  void saveData(T data, {int? version});
  void updateData(T data, {int? version});
}
