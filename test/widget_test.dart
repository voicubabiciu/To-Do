// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do/core/data/moor_database.dart';
import 'package:to_do/core/mappers/entry_mapper.dart';
import 'package:to_do/features/to_do_list/domain/entities/to_do.dart';
import 'package:to_do/features/to_do_list/domain/repositories/to_do_list_repository.dart';
import 'package:to_do/injectors/get_to_do_injector.dart';
import 'package:to_do/injectors/injector_container.dart';

import 'package:to_do/main.dart';

class ToDoListFakeRepository implements IToDoListRepository {
  ToDoListFakeRepository({
    required this.database,
    required this.entryMapper,
  });

  final AppDatabase database;
  final IEntryMapper<ToDoEntry, ToDo> entryMapper;

  Future<void> cacheData(List<ToDo> toDos) async {
    for (final ToDo toDo in toDos) {
      await database.insertToDo(entryMapper.mapFromDomainModel(toDo));
    }
  }

  @override
  Future<List<ToDo>> loadToDos() async {
    final List<ToDo> list = [
      ToDo(id: '123', title: 'title', details: 'details', date: DateTime.now())
    ];
    await cacheData(list);
    return list;
  }
}

void main() {
  testWidgets('Get to do test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
        ProviderScope(overrides: [
          toDoRepositoryProvider.overrideWithProvider(Provider((ref) =>
              ToDoListFakeRepository(
                  database: ref.read(db),
                  entryMapper: ref.read(toDoEntryMapperProvider))))
        ], child: MyApp()),
        Duration(seconds: 2));
    // expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Tap the '+' icon and trigger a frame.

    // await tester.drag(find.byType(RefreshIndicator), const Offset(0, 50));
    // await tester.pump();

    //  Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
