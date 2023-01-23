import 'package:flutter/material.dart';
import 'package:todo_list/Screens/form_screen.dart';
import 'package:todo_list/Screens/initial_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const InitialScreen();
  }
}
