import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/core/data_sources/remote_data_source.dart';
import 'package:to_do/core/resources/resource.dart';
import 'package:to_do/features/to_do_list/data/mappers/to_do_dto_mapper.dart';
import 'package:to_do/features/to_do_list/data/models/to_do_dto.dart';
import 'package:to_do/features/to_do_list/data/remote/to_do_data_source.dart';
import 'package:to_do/features/to_do_list/data/repositories/to_do_list_repository.dart';
import 'package:to_do/features/to_do_list/data/repositories/todo_state_notifier.dart';
import 'package:to_do/features/to_do_list/domain/entities/to_do.dart';
import 'package:to_do/features/to_do_list/domain/repositories/to_do_list_repository.dart';
import 'package:to_do/features/to_do_list/domain/use_cases/get_todos_usecase.dart';
import 'package:to_do/features/to_do_list/domain/use_cases/load_todos_usecase.dart';
import 'package:to_do/features/to_do_list/presentation/state/to_do_state.dart'
    as state;
import 'package:to_do/injectors/networking_injectors.dart';

// * Mappers
final Provider<ToDoDtoMapper> toDoDtoMapperProvider =
    Provider<ToDoDtoMapper>((StateNotifierProviderRef ref) => ToDoDtoMapper());

// * Data Sources

final Provider<IRemoteDataSourceNoParam<List<ToDoDto>>>
    toDoRemoteDataSourceProvider =
    Provider<IRemoteDataSourceNoParam<List<ToDoDto>>>(
        (StateNotifierProviderRef ref) => ToDoRemoteDataSource(
              dio: ref.read(dioProvider),
            ));

// * Repositories

final Provider<IToDoListRepository> toDoRepositoryProvider =
    Provider<IToDoListRepository>(
        (StateNotifierProviderRef ref) => ToDoListRepository(
              remoteDataSource: ref.read(toDoRemoteDataSourceProvider),
              mapper: ref.read(toDoDtoMapperProvider),
              todos: toDoStateProvider,
            ));

// * Usecases

final Provider<LoadToDoUseCase> loadToDosUseCaseProvider =
    Provider<LoadToDoUseCase>((StateNotifierProviderRef ref) =>
        LoadToDoUseCase(repository: ref.read(toDoRepositoryProvider)));

final Provider<GetTodosUseCase> getToDosUseCaseProvider =
    Provider<GetTodosUseCase>((StateNotifierProviderRef ref) =>
        GetTodosUseCase(repository: ref.read(toDoRepositoryProvider)));

// * State notifiers
// final StateNotifierProvider<state.ToDoStateNotifier, Resource<List<ToDo>>>
//     toDoNotifierProvider =
//     StateNotifierProvider<state.ToDoStateNotifier, Resource<List<ToDo>>>(
//         (StateNotifierProviderRef ref) => state.ToDoStateNotifier(
//             getToDosUseCase: ref.read(getToDosUseCaseProvider)));
final StateNotifierProvider<ToDoStateNotifier, Resource<List<ToDo>>>
    toDoStateProvider =
    StateNotifierProvider<ToDoStateNotifier, Resource<List<ToDo>>>(
        (_) => ToDoStateNotifier());
