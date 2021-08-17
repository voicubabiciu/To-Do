import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/core/resources/resource.dart';
import 'package:to_do/features/todo_list/data/todo_list_repository.dart';
import 'package:to_do/features/todo_list/domain/entities/todo.dart';

class TodoStateNotifier extends StateNotifier<Resource<List<Todo>>> {
  TodoStateNotifier({
    required this.repository,
  }) : super(const Resource<List<Todo>>.none()) {
    sub = repository.watchToDos().listen((event) {
      state = event;
    });
  }

  final ToDoListRepository repository;
  late final StreamSubscription<Resource<List<Todo>>> sub;

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }
}
