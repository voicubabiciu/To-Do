import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/core/resources/resource.dart';
import 'package:to_do/core/use_cases/use_case.dart';
import 'package:to_do/features/to_do_list/data/repositories/todo_state_notifier.dart';
import 'package:to_do/features/to_do_list/domain/entities/to_do.dart';
import 'package:to_do/features/to_do_list/domain/repositories/to_do_list_repository.dart';

class GetTodosUseCase
    implements
        INoParamUseCase<
            AutoDisposeStateNotifierProvider<ToDoStateNotifier,
                Resource<List<ToDo>>>> {
  GetTodosUseCase({required this.repository}) {
    repository.loadToDos();
  }

  final IToDoListRepository repository;

  @override
  AutoDisposeStateNotifierProvider<ToDoStateNotifier, Resource<List<ToDo>>>
      dispatch() {
    return repository.toDos;
  }
}
