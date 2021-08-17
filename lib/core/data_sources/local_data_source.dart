import 'package:to_do/core/data/moor_database.dart';

abstract class ILocalDataSource<D> {
  Future<void> cacheData(List<D> entries);
  Future<void> insertEntry(D entry);
  Future<void> updateEntry(D entry);

  Future<List<D>> retrieveData();

  Stream<List<TodoEntry>> watchData();
}
