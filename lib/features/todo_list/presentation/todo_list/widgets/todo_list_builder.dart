import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/features/todo_list/di/fetch_todo_injector.dart';
import 'package:to_do/features/todo_list/di/todo_details_injector.dart';
import 'package:to_do/features/todo_list/domain/entities/todo.dart';
import 'package:to_do/features/todo_list/presentation/todo_details/todo_details_state_notifier.dart';
import 'package:to_do/features/todo_list/presentation/todo_list/widgets/card_item.dart';

class ToDoListBuilder extends ConsumerWidget {
  const ToDoListBuilder({Key? key, required this.toDoList}) : super(key: key);

  final List<Todo> toDoList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext context, int index) => ProviderScope(
        overrides: [
          todoDetailsStateNotifier.overrideWithProvider(StateNotifierProvider(
              (ref) => TodoDetailsStateNotifier(
                  state: toDoList[index],
                  repository: ref.read(todoRepositoryProvider))))
        ],
        child: const TodoCardItem(),
      ),
      itemCount: toDoList.length,
    );
  }
}
