import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/core/resources/resource.dart';
import 'package:to_do/features/to_do_list/domain/entities/to_do.dart';
import 'package:to_do/features/to_do_list/domain/use_cases/load_todos_usecase.dart';
import 'package:to_do/features/to_do_list/presentation/state/to_do_event.dart';

// class ToDoStateNotifier extends StateNotifier<Resource<List<ToDo>>> {
//   ToDoStateNotifier({required this.getToDosUseCase}) : super(const Resource<List<ToDo>>.none()) {
//     getTodos();
//   }

//   final GetTodosUseCase getToDosUseCase;

//   Future<void> getTodos() async {
//     try {
//       state = const Resource<List<ToDo>>.progress();
//       state = Resource<List<ToDo>>.success(await getToDosUseCase.dispatch());
//     } on DioError  catch (e){
//       state =  Resource<List<ToDo>>.fail(e);
//     }
//   }
// }
