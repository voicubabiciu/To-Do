import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/core/resources/resource.dart';
import 'package:to_do/features/to_do_list/domain/entities/to_do.dart';
import 'package:to_do/features/to_do_list/presentation/widgets/to_do_list_builder.dart';
import 'package:to_do/injectors/get_to_do_injector.dart';

class ToDosScreen extends StatelessWidget {
  const ToDosScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple To Do list'),
      ),
      body: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final Resource<List<ToDo>> state =
            ref.watch(ref.read(getToDosUseCaseProvider).dispatch());

        return state.when(
            none: () => const Center(
                  child: Text('No To Dos'),
                ),
            success: (_) => ToDoListBuilder(toDoList: _),
            progress: (_) => const Center(child: CircularProgressIndicator()),
            fail: (_, __) => Center(child: Text(_.message)));
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/second');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
