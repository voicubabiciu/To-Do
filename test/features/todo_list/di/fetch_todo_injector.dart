import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/core/resources/resource.dart';
import 'package:to_do/features/todo_list/data/todo_list_repository.dart';
import 'package:to_do/features/todo_list/di/fetch_todo_injector.dart';
import 'package:to_do/features/todo_list/domain/entities/todo.dart';
// import 'package:to_do/features/todo_list/domain/todo_list_repository.dart';

import '../data/repositories/mock_fetch_todo_repository.dart';

// * Repositories

final Provider<MockToDoListRepository> fakeFetchTodoRepositoryProvider =
    Provider<MockToDoListRepository>(
        (StateNotifierProviderRef ref) => MockToDoListRepository());
