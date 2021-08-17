import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/features/todo_list/domain/entities/todo.dart';
import 'package:to_do/features/todo_list/presentation/todo_details/todo_details_state_notifier.dart';

final todoDetailsStateNotifier =
    StateNotifierProvider<TodoDetailsStateNotifier, Todo>(
        (ref) => throw UnimplementedError());
