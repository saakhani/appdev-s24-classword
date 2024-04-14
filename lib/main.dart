import 'package:classwork/provider/todo_provider.dart';
import 'package:classwork/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 25, 116, 252)),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}

void main() => runApp(const MyApp());