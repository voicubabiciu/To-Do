import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/core/resources/resource.dart';
import 'package:to_do/features/to_do_list/domain/entities/to_do.dart';
import 'package:to_do/features/to_do_list/presentation/widgets/to_do_list_builder.dart';
import 'package:to_do/injectors/get_to_do_injector.dart';
import 'package:to_do/main.dart';

class ToDosScreen extends StatelessWidget {
  ToDosScreen();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Simple To Do list'),
      ),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final Resource<List<ToDo>> state =
              ref.watch(ref.read(getToDosUseCaseProvider).dispatch());
          ref.listen(ref.read(getToDosUseCaseProvider).dispatch(),
              (Resource<List<ToDo>> value) {
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
                      child!,
                    ],
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
              fail: (_, List<ToDo>? data) {
                if (data != null) {
                  return ToDoListBuilder(toDoList: data);
                }
                return const Center(child: Text('No To Dos'));
              });
        },
        child: Align(
          alignment: Alignment.center,
          child: Center(
            child: FractionallySizedBox(
              widthFactor: 0.1,
              heightFactor: 0.1,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Loading...')
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final SnackBar snackBar = SnackBar(content: Text('sdfsdfs'));
          rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
          // Navigator.pushNamed(context, '/second');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
