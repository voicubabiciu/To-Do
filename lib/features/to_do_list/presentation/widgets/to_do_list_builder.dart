import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/features/to_do_list/domain/entities/to_do.dart';
import 'package:to_do/features/to_do_list/presentation/widgets/card_item.dart';
import 'package:to_do/injectors/get_to_do_injector.dart';

class ToDoListBuilder extends ConsumerWidget {
  const ToDoListBuilder({Key? key, required this.toDoList}) : super(key: key);

  final List<ToDo> toDoList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext context, int index) => CardItem(
        title: toDoList[index].title,
        dateTime: toDoList[index].date,
      ),
      itemCount: toDoList.length,
    );
  }
}
