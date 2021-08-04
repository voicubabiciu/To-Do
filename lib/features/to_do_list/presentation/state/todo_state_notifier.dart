import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/core/resources/resource.dart';
import 'package:to_do/features/to_do_list/domain/entities/to_do.dart';
import 'package:to_do/features/to_do_list/domain/use_cases/load_todos_usecase.dart';

class ToDoStateNotifier extends StateNotifier<Resource<List<ToDo>>> {
  ToDoStateNotifier({required this.loadToDoUseCase})
      : super(const Resource<List<ToDo>>.none()) {
    loadtoDo();
  }

  final LoadToDoUseCase loadToDoUseCase;
  final List<ToDo> toDoList = <ToDo>[];

  void cacheToDo(List<ToDo> newToDoList) {
    toDoList.clear();
    toDoList.addAll(newToDoList);
  }

  Future<void> loadtoDo() async {
    try {
      state = Resource<List<ToDo>>.progress(data: toDoList);
      cacheToDo(await loadToDoUseCase.dispatch());
      state = Resource<List<ToDo>>.success(toDoList);
    } on DioError catch (e) {
      state = Resource<List<ToDo>>.fail(e, data: toDoList);
    }
  }
}
