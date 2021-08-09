import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/core/data/moor_database.dart';
import 'package:to_do/core/mappers/entry_mapper.dart';
import 'package:to_do/core/resources/resource.dart';
import 'package:to_do/features/to_do_list/domain/entities/to_do.dart';
import 'package:to_do/features/to_do_list/domain/use_cases/load_todos_usecase.dart';

class ToDoStateNotifier extends StateNotifier<Resource<List<ToDo>>> {
  ToDoStateNotifier({
    required this.loadToDoUseCase,
    required this.database,
    required this.entryMapper,
  }) : super(const Resource<List<ToDo>>.none()) {
    toDoSubscription = database.watchToDos().listen((List<ToDoEntry> entries) {
      loadedToDos = entryMapper.mapToDomainModelList(entries);
      state = Resource<List<ToDo>>.success(loadedToDos);
    });
    loadtoDo();
  }

  final LoadToDoUseCase loadToDoUseCase;
  final AppDatabase database;
  final IEntryMapper<ToDoEntry, ToDo> entryMapper;
  late final StreamSubscription<List<ToDoEntry>> toDoSubscription;
  List<ToDo> loadedToDos = <ToDo>[];

  Future<void> loadtoDo() async {
    try {
      state = Resource<List<ToDo>>.progress(data: loadedToDos);
      await loadToDoUseCase.dispatch();
    } on DioError catch (e) {
      state = Resource<List<ToDo>>.fail(e, data: loadedToDos);
    }
  }

  @override
  void dispose() {
    toDoSubscription.cancel();
    super.dispose();
  }
}
