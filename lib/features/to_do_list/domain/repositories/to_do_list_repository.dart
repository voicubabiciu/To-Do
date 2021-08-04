import 'dart:async';
import 'package:to_do/core/resources/resource.dart';
import 'package:to_do/features/to_do_list/domain/entities/to_do.dart';

abstract class IToDoListRepository {
  StreamController<Resource<List<ToDo>>> get data =>
      StreamController<Resource<List<ToDo>>>();

  void loadToDos();

  void dispose() {}
}
