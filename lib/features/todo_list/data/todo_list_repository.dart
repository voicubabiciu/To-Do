import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:to_do/core/data/moor_database.dart';
import 'package:to_do/core/data_sources/local_data_source.dart';
import 'package:to_do/core/data_sources/remote_data_source.dart';
import 'package:to_do/core/exceptions/failures.dart';
import 'package:to_do/core/mappers/domain_mapper.dart';
import 'package:to_do/core/mappers/entry_mapper.dart';
import 'package:to_do/core/resources/resource.dart';
import 'package:to_do/features/todo_list/data/models/todo_dto.dart';
import 'package:to_do/features/todo_list/domain/entities/todo.dart';

class ToDoListRepository {
  ToDoListRepository({
    required this.remoteDataSource,
    required this.addTodoRemoteDataSource,
    required this.localDataSource,
    required this.dtoMapper,
    required this.entryMapper,
  });
  final IRemoteDataSourceNoParam<List<TodoDto>> remoteDataSource;
  final IRemoteDataSource<TodoDto, TodoDto> addTodoRemoteDataSource;
  final ILocalDataSource<TodoEntry> localDataSource;
  final IDomainMapper<TodoDto, Todo> dtoMapper;
  final IEntryMapper<TodoEntry, Todo> entryMapper;

  Future<List<Todo>> _cacheData(List<Todo> toDos) async {
    await localDataSource.cacheData(entryMapper.mapFromDomainModelList(toDos));
    return _retriveData();
  }

  Future<List<Todo>> _retriveData() async {
    return entryMapper
        .mapToDomainModelList(await localDataSource.retrieveData());
  }

  Stream<Resource<List<Todo>>> watchToDos() async* {
    final List<Todo> cachedData = await _retriveData();
    yield Resource<List<Todo>>.progress(data: cachedData);
    try {
      final List<Todo> list =
          dtoMapper.mapToDomainModelList(await remoteDataSource.request());
      await _cacheData(list);
      yield* localDataSource.watchData().map((entries) =>
          Resource<List<Todo>>.success(
              entryMapper.mapToDomainModelList(entries)));
    } on DioError catch (e) {
      // todosController.addError(Resource<List<Todo>>.fail(e, data: cachedData));
      yield Resource<List<Todo>>.fail(Failure(message: e.message),
          data: cachedData);
    }
  }

  Future<Resource<Todo>> addToDo(Todo todo) async {
    try {
      final TodoDto todoDto = await addTodoRemoteDataSource
          .request(dtoMapper.mapFromDomainModel(todo));
      final Todo domainTodo = dtoMapper.mapToDomainModel(todoDto);
      await localDataSource
          .insertEntry(entryMapper.mapFromDomainModel(domainTodo));
      return Resource<Todo>.success(domainTodo);
    } on DioError catch (e) {
      return Resource<Todo>.fail(Failure(message: e.message));
    }
  }

  Future<void> updateToDo(Todo todo) async {
    await localDataSource.updateEntry(entryMapper.mapFromDomainModel(todo));
  }
}
