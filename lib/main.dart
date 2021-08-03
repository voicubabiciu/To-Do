import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/features/add_to_do/presentation/pages/add_to_do_screen.dart';
import 'package:to_do/features/to_do_list/presentation/pages/to_dos_screen.dart';

final ProviderContainer container = ProviderContainer();
void main() {
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const ToDosScreen(),
        '/second': (BuildContext context) => const AddToDo(),
      },
    );
  }
}
