import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:to_do/core/exceptions/failures.dart';
import 'package:to_do/core/resources/resource.dart';
import 'package:to_do/features/todo_list/data/todo_list_repository.dart';
import 'package:to_do/features/todo_list/domain/entities/todo.dart';

class AddTodoStateNotifier extends StateNotifier<Resource<Todo>> {
  AddTodoStateNotifier({
    required this.repository,
    required this.todoTitle,
    required this.todoDate,
  }) : super(const Resource<Todo>.none());
// Todo: inject picker and text controller
  final ToDoListRepository repository;
  final String? todoTitle;
  final DateTime? todoDate;

  Future<void> addTodo() async {
    state = const Resource<Todo>.progress();
    if (todoTitle == null || todoDate == null) {
      state =
          Resource<Todo>.fail(Failure(message: 'Title or Date are not valid'));
      return;
    }
    final todo = Todo(title: todoTitle!, date: todoDate!);
    print(todo);
    state = await repository.addToDo(todo);
  }

  String getDatePickerText(DateTime? date) {
    if (date == null) {
      return 'Pick a date';
    }
    final DateTime now = DateTime.now();
    final int days =
        date.difference(DateTime(now.year, now.month, now.day)).inDays;
    switch (days) {
      case 0:
        return 'Today';
      case 1:
        return 'Tomorrow';
      default:
        return DateFormat('dd/MM/yyyy').format(date);
    }
  }
}
