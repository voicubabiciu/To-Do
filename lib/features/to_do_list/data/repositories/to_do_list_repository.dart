import 'dart:async';

import 'package:dio/dio.dart';
import 'package:to_do/core/data_sources/remote_data_source.dart';
import 'package:to_do/core/resources/resource.dart';
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
  StreamController<Resource<List<ToDo>>> data =
      StreamController<Resource<List<ToDo>>>();
  @override
  Future<void> loadToDos() async {
    try {
      data.add(const Resource<List<ToDo>>.progress());
      data.add(Resource<List<ToDo>>.success(
          mapper.mapToDomainModelList(await remoteDataSource.request())));
    } on DioError catch (e) {
      data.add(Resource<List<ToDo>>.fail(e));
    }
  }

  @override
  void dispose() {
    print('Good Bye');
    data.close();
  }
}
