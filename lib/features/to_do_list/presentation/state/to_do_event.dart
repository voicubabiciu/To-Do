import 'package:to_do/features/to_do_list/domain/entities/to_do.dart';

abstract class ToDoEvent {
  const ToDoEvent();
}

class ToDoInitial extends ToDoEvent {
  const ToDoInitial();
}

class ToDoLoading extends ToDoEvent {
  const ToDoLoading();
}

class ToDoError extends ToDoEvent {
  final String message;
  const ToDoError(this.message);
}

class ToDoLoaded extends ToDoEvent {
  final List<ToDo> toDoList;
  const ToDoLoaded(this.toDoList);
}
