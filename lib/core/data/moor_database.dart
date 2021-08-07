import 'package:moor/moor.dart';
import 'package:to_do/core/data/tables/to_do_table.dart';
export 'database/shared.dart';

part 'moor_database.g.dart';

@UseMoor(tables: <Type>[ToDoEntries])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);
  @override
  int get schemaVersion => 1;
  Future<List<ToDoEntry>> getToDos() =>
      select<ToDoEntries, ToDoEntry>(toDoEntries).get();
  Stream<List<ToDoEntry>> watchToDos() =>
      select<ToDoEntries, ToDoEntry>(toDoEntries).watch();
  Future<int> insertToDo(ToDoEntry todo) =>
      into<ToDoEntries, ToDoEntry>(toDoEntries)
          .insert(todo, mode: InsertMode.insertOrReplace);
}
