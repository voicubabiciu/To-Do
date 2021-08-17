import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/core/design/alerts.dart';
import 'package:to_do/core/resources/resource.dart';
import 'package:to_do/features/todo_list/domain/entities/todo.dart';
import 'package:to_do/features/todo_list/presentation/todo_list/widgets/todo_list_builder.dart';
import 'package:to_do/features/todo_list/di/fetch_todo_injector.dart';

class ToDosScreen extends ConsumerWidget {
  const ToDosScreen();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    handleUIMessages(ref, context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.refresh(fetchTodoStateNotifierProvider);
        },
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final Resource<List<Todo>> state =
                ref.watch(fetchTodoStateNotifierProvider);
            // Todo remove when
            return state.when(
                none: () => const ToDoListBuilder(toDoList: []),
                success: (_) => ToDoListBuilder(toDoList: _),
                progress: (List<Todo>? data) {
                  return ToDoListBuilder(toDoList: data ?? []);
                },
                fail: (_, List<Todo>? data) {
                  return ToDoListBuilder(toDoList: data ?? []);
                });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/addToDo');
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void handleUIMessages(WidgetRef ref, BuildContext context) {
    ref.listen(fetchTodoStateNotifierProvider, (Resource<List<Todo>> value) {
      value.when(
          none: () {},
          success: (_) {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          progress: (_) {
            showLoadingDialog('Fetching todos', context);
          },
          fail: (exception, _) {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
            displayErrorSnackBar(exception);
          });
    });
  }
}
