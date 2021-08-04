import 'package:to_do/core/resources/resource.dart';
import 'package:to_do/core/use_cases/use_case.dart';
import 'package:to_do/features/to_do_list/domain/entities/to_do.dart';
import 'package:to_do/features/to_do_list/domain/repositories/to_do_list_repository.dart';

class LoadToDoUseCase implements INoParamFutureUseCase<List<ToDo>> {
  LoadToDoUseCase({required this.repository}) {
    repository.loadToDos();
  }

  final IToDoListRepository repository;

  @override
  Future<List<ToDo>> dispatch() async {
    return repository.loadToDos();
  }
}
