import 'dart:async';

import 'package:dio/dio.dart';
import 'package:to_do/core/data_sources/remote_data_source.dart';
import 'package:to_do/features/to_do_list/data/mappers/to_do_dto_mapper.dart';
import 'package:to_do/features/to_do_list/data/models/to_do_dto.dart';
import 'package:to_do/features/to_do_list/domain/entities/to_do.dart';
import 'package:to_do/features/to_do_list/domain/repositories/to_do_list_repository.dart';

class ToDoListRepository implements IToDoListRepository {
  ToDoListRepository({required this.remoteDataSource, required this.mapper}) {
    loadToDos();
  }

  final IRemoteDataSourceNoParam<List<ToDoDto>> remoteDataSource;
  final ToDoDtoMapper mapper;

  @override
  Future<List<ToDo>> loadToDos() async {
    try {
      return mapper.mapToDomainModelList(await remoteDataSource.request());
    } on DioError {
      rethrow;
    }
  }

  void dispose() {}
}
