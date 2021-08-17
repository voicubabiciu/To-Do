import 'dart:io';

import 'package:dio/dio.dart';
import 'package:to_do/core/data_sources/remote_data_source.dart';
import 'package:to_do/features/todo_list/data/models/todo_dto.dart';

class FetchTodosRemoteDataSource
    implements IRemoteDataSourceNoParam<List<TodoDto>> {
  const FetchTodosRemoteDataSource({required this.dio});

  final Dio dio;

  @override
  Future<List<TodoDto>> request() async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));
      final Response<dynamic> response = await dio.get<dynamic>('/todos');

      if (response.statusCode != 200) {
        throw const HttpException('Ups that did\'t work');
      }
      return List<TodoDto>.of(
          response.data!.map<TodoDto>((dynamic el) => TodoDto.fromJson(el)));
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    }
  }
}
