import 'package:to_do/core/data/moor_database.dart';
import 'package:to_do/core/data/tables/to_do_table.dart';
import 'package:to_do/core/data_sources/local_data_source.dart';

class ToDoLocalDataSource implements ILocalDataSource<TodoEntry> {
  ToDoLocalDataSource({required this.database});

  final AppDatabase database;
  @override
  Future<void> cacheData(List<TodoEntry> entries) async {
    for (final TodoEntry toDo in entries) {
      await database.insertToDo(toDo);
    }
  }

  @override
  Future<List<TodoEntry>> retrieveData() {
    return database.getToDos();
  }

  @override
  Stream<List<TodoEntry>> watchData() {
    return database.watchToDos();
  }

  @override
  Future<void> insertEntry(TodoEntry entry) async {
    await database.insertToDo(entry);
  }

  @override
  Future<void> updateEntry(TodoEntry entry) async {
    await database.updateTodo(entry);
  }
}
