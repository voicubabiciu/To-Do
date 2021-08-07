import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/core/data/moor_database.dart';
import 'package:to_do/core/data_sources/remote_data_source.dart';
import 'package:to_do/core/mappers/domain_mapper.dart';
import 'package:to_do/core/mappers/entry_mapper.dart';
import 'package:to_do/core/resources/resource.dart';
import 'package:to_do/features/to_do_list/data/data_sources/remote/to_do_remote_data_source.dart';
import 'package:to_do/features/to_do_list/data/mappers/to_do_dto_mapper.dart';
import 'package:to_do/features/to_do_list/data/mappers/todo_entry_mapper.dart';
import 'package:to_do/features/to_do_list/data/models/to_do_dto.dart';
import 'package:to_do/features/to_do_list/data/repositories/to_do_list_repository.dart';
import 'package:to_do/features/to_do_list/presentation/state/todo_state_notifier.dart';
import 'package:to_do/features/to_do_list/domain/entities/to_do.dart';
import 'package:to_do/features/to_do_list/domain/repositories/to_do_list_repository.dart';
import 'package:to_do/features/to_do_list/domain/use_cases/load_todos_usecase.dart';
import 'package:to_do/injectors/injector_container.dart';
import 'package:to_do/injectors/networking_injectors.dart';

// * Mappers
final Provider<IDomainMapper<ToDoDto, ToDo>> toDoDtoMapperProvider =
    Provider((_) => ToDoDtoMapper());
final Provider<IEntryMapper<ToDoEntry, ToDo>> toDoEntryMapperProvider =
    Provider((_) => ToDoEntryMapper());

// * Data Sources

final Provider<IRemoteDataSourceNoParam<List<ToDoDto>>>
    toDoRemoteDataSourceProvider =
    Provider((StateNotifierProviderRef ref) => ToDoRemoteDataSource(
          dio: ref.read(dioProvider),
        ));

// * Repositories

final Provider<IToDoListRepository> toDoRepositoryProvider =
    Provider((StateNotifierProviderRef ref) => ToDoListRepository(
          remoteDataSource: ref.read(toDoRemoteDataSourceProvider),
          database: ref.read(db),
          dtoMapper: ref.read(toDoDtoMapperProvider),
          entryMapper: ref.read(toDoEntryMapperProvider),
        ));

// * Usecases

final Provider<LoadToDoUseCase> loadToDosUseCaseProvider =
    Provider((StateNotifierProviderRef ref) => LoadToDoUseCase(
          repository: ref.read(toDoRepositoryProvider),
        ));

// * State notifiers

final AutoDisposeStateNotifierProvider<ToDoStateNotifier, Resource<List<ToDo>>>
    toDosStateNotifier = StateNotifierProvider.autoDispose(
        (AutoDisposeStateNotifierProviderRef ref) => ToDoStateNotifier(
              loadToDoUseCase: ref.read(loadToDosUseCaseProvider),
              database: ref.read(db),
              entryMapper: ref.read(toDoEntryMapperProvider),
            ));
