import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(child: Text("data")),
    );
  }
}