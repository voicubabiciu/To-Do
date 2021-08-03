import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/core/data_sources/remote_data_source.dart';
import 'package:to_do/core/resources/resource.dart';
import 'package:to_do/features/to_do_list/data/mappers/to_do_dto_mapper.dart';
import 'package:to_do/features/to_do_list/data/models/to_do_dto.dart';
import 'package:to_do/features/to_do_list/data/repositories/todo_state_notifier.dart';
import 'package:to_do/features/to_do_list/domain/entities/to_do.dart';
import 'package:to_do/features/to_do_list/domain/repositories/to_do_list_repository.dart';
import 'package:to_do/main.dart';
import 'package:rxdart/rxdart.dart';

class ToDoListRepository implements IToDoListRepository {
  ToDoListRepository(
      {required this.remoteDataSource,
      required this.mapper,
      required this.todos});

  final IRemoteDataSourceNoParam<List<ToDoDto>> remoteDataSource;
  final ToDoDtoMapper mapper;
  final StateNotifierProvider<ToDoStateNotifier, Resource<List<ToDo>>> todos;
  @override
  Future<void> loadToDos() async {
    container.read(todos.notifier).value = Resource<List<ToDo>>.success(
        mapper.mapToDomainModelList(await remoteDataSource.request()));
  }

  @override
  StateNotifierProvider<ToDoStateNotifier, Resource<List<ToDo>>> get toDos =>
      todos;

  void dispose() {}
}
