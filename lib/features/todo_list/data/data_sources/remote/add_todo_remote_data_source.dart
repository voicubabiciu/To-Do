import 'dart:io';

import 'package:dio/dio.dart';
import 'package:to_do/core/data_sources/remote_data_source.dart';
import 'package:to_do/features/todo_list/data/models/todo_dto.dart';

class AddTodoRemoteDataSource implements IRemoteDataSource<TodoDto, TodoDto> {
  const AddTodoRemoteDataSource({required this.dio});

  final Dio dio;

  @override
  Future<TodoDto> request(TodoDto todoDto) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));
      final Response<dynamic> response =
          await dio.post<dynamic>('/todos', data: todoDto.toJson());

      if (response.statusCode != 200) {
        throw const HttpException('Ups that did\'t work');
      }
      print(response.data);
      return TodoDto.fromJson(response.data);
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    }
  }
}
