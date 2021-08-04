import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/core/data_sources/remote_data_source.dart';
import 'package:to_do/core/resources/resource.dart';
import 'package:to_do/features/to_do_list/data/mappers/to_do_dto_mapper.dart';
import 'package:to_do/features/to_do_list/data/models/to_do_dto.dart';
import 'package:to_do/features/to_do_list/data/repositories/todo_state_notifier.dart';
import 'package:to_do/features/to_do_list/domain/entities/to_do.dart';
import 'package:to_do/features/to_do_list/domain/repositories/to_do_list_repository.dart';

class ToDoListRepository implements IToDoListRepository {
  ToDoListRepository(
      {required this.remoteDataSource,
      required this.mapper,
      required this.reader});

  final IRemoteDataSourceNoParam<List<ToDoDto>> remoteDataSource;
  final ToDoDtoMapper mapper;
  final AutoDisposeStateNotifierProvider<ToDoStateNotifier,
          Resource<List<ToDo>>> todos =
      StateNotifierProvider.autoDispose<ToDoStateNotifier,
          Resource<List<ToDo>>>((_) => ToDoStateNotifier());
  final Reader reader;

  @override
  Future<void> loadToDos() async {
    final ToDoStateNotifier state = reader(todos.notifier);
    try {
      state.value = Resource<List<ToDo>>.progress(data: state.toDoList);
      final List<ToDo> list =
          mapper.mapToDomainModelList(await remoteDataSource.request());
      state.value = Resource<List<ToDo>>.success(list);
      state.cacheToDo(list);
    } on DioError catch (e) {
      state.value = Resource<List<ToDo>>.fail(e, data: state.toDoList);
    }
  }

  @override
  AutoDisposeStateNotifierProvider<ToDoStateNotifier, Resource<List<ToDo>>>
      get toDos => todos;

  void dispose() {}
}
