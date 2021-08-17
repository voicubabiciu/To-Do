import 'package:moor/moor.dart';

@DataClassName('TodoEntry')
class TodoEntries extends Table {
  TextColumn get id => text().nullable()();
  TextColumn get title => text()();
  BoolColumn get isChecked => boolean()();
  DateTimeColumn get stamp => dateTime()();
  @override
  Set<Column>? get primaryKey => <Column>{id};
}
