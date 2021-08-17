import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// * Dio
final Provider<Dio> dioProvider = Provider<Dio>((_) => Dio(
    BaseOptions(baseUrl: 'http://localhost:8000/api', connectTimeout: 1000)));
