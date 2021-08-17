import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/core/design/alerts.dart';
import 'package:to_do/core/resources/resource.dart';
import 'package:to_do/features/todo_list/di/add_todo_injector.dart';
import 'package:to_do/features/todo_list/domain/entities/todo.dart';
import 'package:to_do/features/todo_list/presentation/add_todo/widgets/date_picker_button.dart';

class AddToDoScreen extends ConsumerWidget {
  const AddToDoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    handleUIMessages(ref, context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Add new to do'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                onChanged: (value) {
                  ref.read(todoTitleProvider).state = value;
                },
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  labelText: 'Enter new task',
                  border: InputBorder.none, //  OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const DatePickerButton()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () =>
              ref.read(addTodoStateNotifierProvider.notifier).addTodo(),
          label: Row(
            children: const <Widget>[
              Text('New task'),
              SizedBox(width: 20),
              Icon(Icons.add),
            ],
          ),
        ),
      ),
    );
  }

  void handleUIMessages(WidgetRef ref, BuildContext context) {
    ref.listen(addTodoStateNotifierProvider, (Resource<Todo> value) {
      value.when(
          none: () {},
          success: (_) {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          progress: (_) {
            showLoadingDialog('Loading', context);
          },
          fail: (fail, __) {
            Navigator.of(context).pop();
            displayErrorSnackBar(fail);
          });
    });
  }
}
