import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do/core/resources/resource.dart';
import 'package:to_do/features/todo_list/domain/entities/todo.dart';
import 'package:to_do/features/todo_list/di/fetch_todo_injector.dart';

import '../../di/fetch_todo_injector.dart';

void main() {
  test('Retriving data from repo', () async {
    final List<Todo> expectedValue = <Todo>[
      Todo(id: '123', title: 'title', isChecked: false, date: DateTime(2021))
    ];
    final ProviderContainer container = ProviderContainer(overrides: <Override>[
      todoRepositoryProvider
          .overrideWithProvider(fakeFetchTodoRepositoryProvider)
    ]);
    addTearDown(container.dispose);

    expect(
      container.read(fetchTodoStateNotifierProvider.notifier).state,
      const Resource<List<Todo>>.progress(),
    );

    // We increment the value
    await container.read(fetchTodoStateNotifierProvider.notifier).fetchToDo();

    expect(
      container.read(fetchTodoStateNotifierProvider.notifier).state,
      Resource<List<Todo>>.success(expectedValue),
    );
  });
  test('Provider state is not shared', () async {
    // Do not share this between tests.
    final ProviderContainer container = ProviderContainer(overrides: <Override>[
      todoRepositoryProvider
          .overrideWithProvider(fakeFetchTodoRepositoryProvider)
    ]);
    addTearDown(container.dispose);

    expect(
      container.read(fetchTodoStateNotifierProvider.notifier).state,
      const Resource<List<Todo>>.progress(),
    );
  });
}
