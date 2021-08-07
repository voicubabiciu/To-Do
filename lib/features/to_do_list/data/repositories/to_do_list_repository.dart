import 'dart:async';

import 'package:dio/dio.dart';
import 'package:to_do/core/data/moor_database.dart';
import 'package:to_do/core/data_sources/remote_data_source.dart';
import 'package:to_do/core/mappers/domain_mapper.dart';
import 'package:to_do/core/mappers/entry_mapper.dart';
import 'package:to_do/features/to_do_list/data/models/to_do_dto.dart';
import 'package:to_do/features/to_do_list/domain/entities/to_do.dart';
import 'package:to_do/features/to_do_list/domain/repositories/to_do_list_repository.dart';

class ToDoListRepository implements IToDoListRepository {
  ToDoListRepository({
    required this.remoteDataSource,
    required this.database,
    required this.dtoMapper,
    required this.entryMapper,
  });

  final IRemoteDataSourceNoParam<List<ToDoDto>> remoteDataSource;
  final AppDatabase database;
  final IDomainMapper<ToDoDto, ToDo> dtoMapper;
  final IEntryMapper<ToDoEntry, ToDo> entryMapper;

  Future<void> cacheData(List<ToDo> toDos) async {
    for (final ToDo toDo in toDos) {
      await database.insertToDo(entryMapper.mapFromDomainModel(toDo));
    }
  }

  @override
  Future<void> loadToDos() async {
    try {
      final List<ToDo> list =
          dtoMapper.mapToDomainModelList(await remoteDataSource.request());
      await cacheData(list);
    } on DioError {
      rethrow;
    }
  }
}
