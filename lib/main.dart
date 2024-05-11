import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Products',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List"),
      ),
    );
  }
}

void main() => runApp(const MyApp());

class Area {
  static double get pi => 3.141592;

  double circle(double radius) {
    if (radius < 0) {
      throw Exception("Radius cannot be negative");
    }
    return (pi * radius.square);
  }

  double rectangle(double length, double width) {
    return length * width;
  }
}

extension NumSquare on num {
  num get square => this * this;
}
