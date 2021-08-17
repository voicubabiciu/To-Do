import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/core/resources/resource.dart';
import 'package:to_do/features/todo_list/di/fetch_todo_injector.dart';
import 'package:to_do/features/todo_list/domain/entities/todo.dart';
import 'package:to_do/features/todo_list/presentation/add_todo/add_todo_state_notifier.dart';

// * Mappers

// ToDo: Define mappers

// * Data Sources

// * Remote

// * Repositories

// * Usecases

// * States
final AutoDisposeStateProvider<DateTime?> datePickerStateProvider =
    StateProvider.autoDispose((_) => null);

final AutoDisposeStateProvider<String?> todoTitleProvider =
    StateProvider.autoDispose((_) => null);

final AutoDisposeStateNotifierProvider<AddTodoStateNotifier, Resource<Todo>>
    addTodoStateNotifierProvider = StateNotifierProvider.autoDispose(
        (AutoDisposeStateNotifierProviderRef ref) => AddTodoStateNotifier(
            repository: ref.watch(todoRepositoryProvider),
            todoTitle: ref.watch(todoTitleProvider).state,
            todoDate: ref.watch(datePickerStateProvider).state));
