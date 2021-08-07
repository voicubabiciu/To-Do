import 'package:moor/moor.dart';

@DataClassName('ToDoEntry')
class ToDoEntries extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get details => text()();
  DateTimeColumn get stamp => dateTime()();
  @override
  Set<Column>? get primaryKey => {id};
}
