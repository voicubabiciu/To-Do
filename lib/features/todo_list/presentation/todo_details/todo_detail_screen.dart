import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/features/todo_list/di/todo_details_injector.dart';

class TodoDetailsScreen extends ConsumerWidget {
  const TodoDetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(todoDetailsStateNotifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(state.title),
      ),
      body: Container(),
    );
  }
}
