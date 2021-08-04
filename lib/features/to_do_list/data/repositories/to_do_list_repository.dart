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
      required this.stateNotifier}) {
    loadToDos();
  }

  final IRemoteDataSourceNoParam<List<ToDoDto>> remoteDataSource;
  final ToDoDtoMapper mapper;
  final ToDoStateNotifier stateNotifier;

  @override
  Future<void> loadToDos() async {
    try {
      stateNotifier.value =
          Resource<List<ToDo>>.progress(data: stateNotifier.toDoList);
      final List<ToDo> list =
          mapper.mapToDomainModelList(await remoteDataSource.request());
      stateNotifier.value = Resource<List<ToDo>>.success(list);
      stateNotifier.cacheToDo(list);
    } on DioError catch (e) {
      stateNotifier.value =
          Resource<List<ToDo>>.fail(e, data: stateNotifier.toDoList);
    }
  }

  void dispose() {}
}
