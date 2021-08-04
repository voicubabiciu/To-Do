import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/core/data_sources/remote_data_source.dart';
import 'package:to_do/core/resources/resource.dart';
import 'package:to_do/features/to_do_list/data/data_sources/remote/to_do_data_source.dart';
import 'package:to_do/features/to_do_list/data/mappers/to_do_dto_mapper.dart';
import 'package:to_do/features/to_do_list/data/models/to_do_dto.dart';
import 'package:to_do/features/to_do_list/data/repositories/to_do_list_repository.dart';
import 'package:to_do/features/to_do_list/presentation/state/todo_state_notifier.dart';
import 'package:to_do/features/to_do_list/domain/entities/to_do.dart';
import 'package:to_do/features/to_do_list/domain/repositories/to_do_list_repository.dart';
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

final AutoDisposeStateProvider<IToDoListRepository> toDoRepositoryProvider =
    StateProvider.autoDispose<IToDoListRepository>(
        (StateNotifierProviderRef ref) {
  final ToDoListRepository repo = ToDoListRepository(
    remoteDataSource: ref.read(toDoRemoteDataSourceProvider),
    mapper: ref.read(toDoDtoMapperProvider),
  );
  // ref.onDispose(() {
  //   repo.dispose();
  // });
  return repo;
});

// * State notifiers
final AutoDisposeStateNotifierProvider<ToDoStateNotifier, Resource<List<ToDo>>>
    toDosStateNotifier =
    StateNotifierProvider.autoDispose<ToDoStateNotifier, Resource<List<ToDo>>>(
        (AutoDisposeStateNotifierProviderRef ref) {
  final ToDoStateNotifier state = ToDoStateNotifier(
    repository: ref.read(toDoRepositoryProvider.notifier).state,
  );
  return state;
});
