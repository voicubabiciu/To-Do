import 'package:dio/dio.dart';

abstract class IRemoteDataSource<P, R> {

  Future<R> request(P payload);
}

abstract class IRemoteDataSourceNoParam<R> {
  Future<R> request();
}