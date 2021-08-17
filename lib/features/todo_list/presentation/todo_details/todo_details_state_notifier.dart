import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/features/todo_list/data/todo_list_repository.dart';
import 'package:to_do/features/todo_list/domain/entities/todo.dart';

class TodoDetailsStateNotifier extends StateNotifier<Todo> {
  TodoDetailsStateNotifier({required Todo state, required this.repository})
      : super(state);

  final ToDoListRepository repository;
  void updadeTodo() {}
  void changeStatus() {
    state = state.copyWith(isChecked: !state.isChecked);
    repository.updateToDo(state);
  }
}
