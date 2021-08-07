import 'package:flutter/material.dart';
import 'package:to_do/features/add_to_do/presentation/pages/add_to_do_screen.dart';
import 'package:to_do/features/not_found/presentation/pages/not_found_screen.dart';
import 'package:to_do/features/to_do_list/presentation/pages/to_dos_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute<ToDosScreen>(
            builder: (_) => const ToDosScreen());
      case '/addToDo':
        return MaterialPageRoute<ToDosScreen>(
            builder: (_) => const AddToDoScreen());
    }
    return MaterialPageRoute<ToDosScreen>(
        builder: (_) => const NotFoundScreen());
  }
}
