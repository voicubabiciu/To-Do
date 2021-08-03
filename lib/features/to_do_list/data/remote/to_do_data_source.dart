import 'dart:io';

import 'package:dio/dio.dart';
import 'package:to_do/core/data_sources/remote_data_source.dart';
import 'package:to_do/features/to_do_list/data/mappers/to_do_dto_mapper.dart';
import 'package:to_do/features/to_do_list/data/models/to_do_dto.dart';
import 'package:to_do/features/to_do_list/domain/entities/to_do.dart';

class ToDoRemoteDataSource implements IRemoteDataSourceNoParam<List<ToDoDto>> {
  const ToDoRemoteDataSource({required this.dio});

  final Dio dio;

  @override
  Future<List<ToDoDto>> request() async {
    final Response<dynamic> response = await dio.get<dynamic>('/todos');

    if (response.statusCode != 200) {
      throw const HttpException('Ups that did\'t work');
    }

    // final List<ToDoDto> list = response.data!.map<ToDoDto>((el) => ToDoDto.fromJson(el)).toList();
    return List<ToDoDto>.of(
        response.data!.map<ToDoDto>((dynamic el) => ToDoDto.fromJson(el)));
  }
}
