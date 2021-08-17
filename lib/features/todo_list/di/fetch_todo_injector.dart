import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/core/data/moor_database.dart';
import 'package:to_do/core/data_sources/local_data_source.dart';
import 'package:to_do/core/data_sources/remote_data_source.dart';
import 'package:to_do/core/mappers/domain_mapper.dart';
import 'package:to_do/core/mappers/entry_mapper.dart';
import 'package:to_do/core/resources/resource.dart';
import 'package:to_do/features/todo_list/data/data_sources/to_do_local_data_source.dart';
import 'package:to_do/features/todo_list/data/data_sources/remote/add_todo_remote_data_source.dart';
import 'package:to_do/features/todo_list/data/data_sources/remote/fetch_todos_remote_data_source.dart';
import 'package:to_do/features/todo_list/data/mappers/todo_dto_mapper.dart';
import 'package:to_do/features/todo_list/data/mappers/todo_entry_mapper.dart';
import 'package:to_do/features/todo_list/data/models/todo_dto.dart';
import 'package:to_do/features/todo_list/data/todo_list_repository.dart';
import 'package:to_do/features/todo_list/di/add_todo_injector.dart';
import 'package:to_do/features/todo_list/domain/entities/todo.dart';
import 'package:to_do/features/todo_list/presentation/add_todo/add_todo_state_notifier.dart';
import 'package:to_do/features/todo_list/presentation/todo_list/todo_state_notifier.dart';
import 'package:to_do/di/injector_container.dart';
import 'package:to_do/di/networking_injectors.dart';

// * Mappers
final Provider<IDomainMapper<TodoDto, Todo>> todoDtoMapperProvider =
    Provider<ToDoDtoMapper>((_) => ToDoDtoMapper());
final Provider<IEntryMapper<TodoEntry, Todo>> todoEntryMapperProvider =
    Provider<ToDoEntryMapper>((_) => ToDoEntryMapper());

// * Data Sources

// * Remote
final Provider<IRemoteDataSourceNoParam<List<TodoDto>>>
    todoRemoteDataSourceProvider = Provider<FetchTodosRemoteDataSource>(
        (StateNotifierProviderRef ref) => FetchTodosRemoteDataSource(
              dio: ref.watch(dioProvider),
            ));

final Provider<IRemoteDataSource<TodoDto, TodoDto>>
    addTodoRemoteDataSourceProvider = Provider<AddTodoRemoteDataSource>(
        (StateNotifierProviderRef ref) => AddTodoRemoteDataSource(
              dio: ref.watch(dioProvider),
            ));
// * Local
final Provider<ILocalDataSource<TodoEntry>> todoLocalDataSourceProvider =
    Provider<ToDoLocalDataSource>(
        (StateNotifierProviderRef ref) => ToDoLocalDataSource(
              database: ref.watch(db),
            ));

// * Repositories

final Provider<ToDoListRepository> todoRepositoryProvider =
    Provider<ToDoListRepository>((StateNotifierProviderRef ref) =>
        ToDoListRepository(
          remoteDataSource: ref.watch(todoRemoteDataSourceProvider),
          addTodoRemoteDataSource: ref.watch(addTodoRemoteDataSourceProvider),
          localDataSource: ref.watch(todoLocalDataSourceProvider),
          dtoMapper: ref.watch(todoDtoMapperProvider),
          entryMapper: ref.watch(todoEntryMapperProvider),
        ));

// * State notifiers

final StateNotifierProvider<TodoStateNotifier, Resource<List<Todo>>>
    fetchTodoStateNotifierProvider =
    StateNotifierProvider<TodoStateNotifier, Resource<List<Todo>>>(
        (StateNotifierProviderRef ref) => TodoStateNotifier(
              repository: ref.watch(todoRepositoryProvider),
            ));
