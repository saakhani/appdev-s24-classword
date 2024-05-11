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
    );
  }
}

void main() => runApp(const MyApp());

class Area {
  static double get pi => 3.141592;

  double circle(double radius) {
    return pi * radius.square;
  }

  double rectangle(double length, double width) {
    return length * width;
  }
}

extension NumSquare on num {
  num get square => this * this;
}
