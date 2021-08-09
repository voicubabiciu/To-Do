import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/core/resources/resource.dart';
import 'package:to_do/features/to_do_list/domain/entities/to_do.dart';
import 'package:to_do/features/to_do_list/presentation/widgets/to_do_list_builder.dart';
import 'package:to_do/injectors/get_to_do_injector.dart';
import 'package:to_do/main.dart';

class ToDosScreen extends ConsumerWidget {
  const ToDosScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple To Do list'),
      ),
      body: RefreshIndicator(
        onRefresh: ref.read(toDosStateNotifier.notifier).loadtoDo,
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final Resource<List<ToDo>> state = ref.watch(toDosStateNotifier);
            print(state);
            ref.listen(toDosStateNotifier, (Resource<List<ToDo>> value) {
              final dynamic data = value.data;
              if (data is DioError) {
                final SnackBar snackBar =
                    SnackBar(content: Text('Oh no ${data.message}'));
                rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
              }
            });
            return state.when(
                none: () => const Center(
                      child: Text('No To Dos'),
                    ),
                success: (_) => ToDoListBuilder(toDoList: _),
                progress: (List<ToDo>? data) {
                  if (data != null) {
                    return Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: ToDoListBuilder(toDoList: data),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: child!,
                        )
                      ],
                    );
                  }
                  return child!;
                },
                fail: (_, List<ToDo>? data) {
                  if (data != null) {
                    return ToDoListBuilder(toDoList: data);
                  }
                  return const Center(child: Text('No To Dos'));
                });
          },
          child: const FractionallySizedBox(
            widthFactor: 0.3,
            child: AspectRatio(
              aspectRatio: 1,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addToDo');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
