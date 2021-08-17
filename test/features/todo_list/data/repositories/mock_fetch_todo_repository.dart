import 'package:to_do/core/resources/resource.dart';
import 'package:to_do/features/todo_list/domain/entities/todo.dart';
import 'package:to_do/features/todo_list/domain/todo_list_repository.dart';

class MockToDoListRepository {
  @override
  Future<void> fetchToDos(StateUpdate<List<Todo>> onStateUpdated) async {
    onStateUpdated(const Resource<List<Todo>>.progress());
    await Future<void>.delayed(const Duration(seconds: 2));

    final List<Todo> list = <Todo>[
      Todo(id: '123', title: 'title', isChecked: false, date: DateTime(2021))
    ];
    onStateUpdated(Resource<List<Todo>>.success(list));
  }

  @override
  Stream<Resource<Todo>> addToDo(Todo todo) async* {
    // TODO: implement addToDo
    throw UnimplementedError();
  }

  @override
  Stream<Resource<List<Todo>>> watchToDos() {
    // TODO: implement watchToDos
    throw UnimplementedError();
  }
}
