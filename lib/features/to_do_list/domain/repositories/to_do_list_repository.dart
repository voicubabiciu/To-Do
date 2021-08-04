import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/core/resources/resource.dart';
import 'package:to_do/features/to_do_list/presentation/state/todo_state_notifier.dart';
import 'package:to_do/features/to_do_list/domain/entities/to_do.dart';

abstract class IToDoListRepository {
  Future<List<ToDo>> loadToDos();
}
