import 'package:moor/moor.dart';
import 'package:to_do/core/data/tables/to_do_table.dart';
export 'database/shared.dart';

part 'moor_database.g.dart';

@UseMoor(tables: <Type>[TodoEntries])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);
  @override
  int get schemaVersion => 1;
  Future<List<TodoEntry>> getToDos() =>
      select<TodoEntries, TodoEntry>(todoEntries).get();
  Stream<List<TodoEntry>> watchToDos() =>
      select<TodoEntries, TodoEntry>(todoEntries).watch();
  Future<int> insertToDo(TodoEntry todo) =>
      into<TodoEntries, TodoEntry>(todoEntries)
          .insert(todo, mode: InsertMode.insertOrReplace);
  Future<int> updateTodo(TodoEntry todo) =>
      (update<TodoEntries, TodoEntry>(todoEntries)
            ..where((t) => t.id.equals(todo.id)))
          .write(TodoEntriesCompanion(isChecked: Value(todo.isChecked)));
}
