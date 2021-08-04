import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/core/resources/resource.dart';
import 'package:to_do/features/to_do_list/domain/entities/to_do.dart';
import 'package:to_do/features/to_do_list/domain/repositories/to_do_list_repository.dart';

class ToDoStateNotifier extends StateNotifier<Resource<List<ToDo>>> {
  ToDoStateNotifier({required this.repository})
      : super(const Resource<List<ToDo>>.none()) {
    sub = repository.data.stream.listen((Resource<List<ToDo>> data) {
      state = data;
    });
  }

  final IToDoListRepository repository;
  final List<ToDo> toDoList = <ToDo>[];
  late final StreamSubscription<Resource<List<ToDo>>> sub;
  @override
  void dispose() {
    // repository.dispose();
    sub.cancel();
    super.dispose();
  }

  void cacheToDo(List<ToDo> newToDoList) {
    toDoList.clear();
    toDoList.addAll(newToDoList);
  }

  Future<void> loadtoDo() async {
    repository.loadToDos();
  }
}
