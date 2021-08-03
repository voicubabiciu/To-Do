import 'package:to_do/core/use_cases/use_case.dart';
import 'package:to_do/features/to_do_list/domain/repositories/to_do_list_repository.dart';

class LoadToDoUseCase implements ISimpleUseCase {
  LoadToDoUseCase({required this.repository});

  final IToDoListRepository repository;

  @override
  Future<void> dispatch() async {
    await repository.loadToDos();
  }
}
