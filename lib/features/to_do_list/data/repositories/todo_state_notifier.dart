import 'package:to_do/core/resources/resource.dart';
import 'package:to_do/core/state/mutable_state.dart';
import 'package:to_do/features/to_do_list/domain/entities/to_do.dart';

class ToDoStateNotifier extends MutableStateNotifier<Resource<List<ToDo>>> {
  ToDoStateNotifier() : super(const Resource<List<ToDo>>.none());
}
