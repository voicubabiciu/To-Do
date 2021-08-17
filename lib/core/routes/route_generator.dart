import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/features/not_found/not_found_screen.dart';
import 'package:to_do/features/todo_list/di/fetch_todo_injector.dart';
import 'package:to_do/features/todo_list/di/todo_details_injector.dart';
import 'package:to_do/features/todo_list/domain/entities/todo.dart';
import 'package:to_do/features/todo_list/presentation/add_todo/pages/add_to_do_screen.dart';
import 'package:to_do/features/todo_list/presentation/todo_details/todo_detail_screen.dart';
import 'package:to_do/features/todo_list/presentation/todo_details/todo_details_state_notifier.dart';
import 'package:to_do/features/todo_list/presentation/todo_list/todo_list_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute<ToDosScreen>(
            builder: (_) => const ToDosScreen());
      case '/addToDo':
        return MaterialPageRoute<AddToDoScreen>(
            builder: (_) => const AddToDoScreen());
      case '/details':
        if (args is Todo) {
          return MaterialPageRoute<TodoDetailsScreen>(
            builder: (_) => ProviderScope(overrides: [
              todoDetailsStateNotifier.overrideWithProvider(
                  StateNotifierProvider((ref) => TodoDetailsStateNotifier(
                      state: args,
                      repository: ref.read(todoRepositoryProvider))))
            ], child: TodoDetailsScreen()),
          );
        }
        return notFound();
    }
    return notFound();
  }

  static MaterialPageRoute<NotFoundScreen> notFound() {
    return MaterialPageRoute<NotFoundScreen>(
        builder: (_) => const NotFoundScreen());
  }
}
