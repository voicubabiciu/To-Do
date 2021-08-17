import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/features/todo_list/di/add_todo_injector.dart';

class DatePickerButton extends ConsumerWidget {
  const DatePickerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final StateController<DateTime?> stateController =
        ref.watch(datePickerStateProvider);
    return MaterialButton(
      onPressed: () => displayDatePicker(stateController, context),
      color: Theme.of(context).scaffoldBackgroundColor,
      shape: const StadiumBorder(
          side: BorderSide(
        width: 2,
        color: Colors.white,
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(Icons.calendar_today_outlined),
            const SizedBox(
              width: 20,
            ),
            Text(ref
                .read(addTodoStateNotifierProvider.notifier)
                .getDatePickerText(stateController.state)),
          ],
        ),
      ),
    );
  }

  Future displayDatePicker(stateController, context) async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: stateController.state ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 7)),
      helpText: 'Select a date',
    );
    if (newDate != null) {
      stateController.state = newDate;
    }
  }
}
