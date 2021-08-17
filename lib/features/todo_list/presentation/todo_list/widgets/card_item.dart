import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:to_do/features/todo_list/di/todo_details_injector.dart';

class TodoCardItem extends ConsumerWidget {
  const TodoCardItem();

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(todoDetailsStateNotifier);
    return Card(
      elevation: 20,
      child: ListTile(
        onTap: () =>
            Navigator.of(context).pushNamed('/details', arguments: state),
        title: Text(
          state.title,
          style: TextStyle(
            decoration: state.isChecked
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        subtitle: Text(DateFormat('dd/MM/yyyy').format(state.date)),
        leading: const Icon(Icons.note),
        trailing: Checkbox(
          shape: const CircleBorder(side: BorderSide(width: 1)),
          onChanged: (_) =>
              ref.read(todoDetailsStateNotifier.notifier).changeStatus(),
          materialTapTargetSize: MaterialTapTargetSize.padded,
          checkColor: Colors.black,
          value: state.isChecked,
        ),
      ),
    );
  }
}
