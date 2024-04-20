import 'package:classwork/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  Widget build(BuildContext context, WidgetRef ref) {
    final userNotifier = ref.watch(userProvider);

    return Scaffold(
      body: switch (userNotifier) {
        AsyncData(:final value) => Padding(           
          padding: const EdgeInsets.all(8.0),
            child: ListView.separated(itemBuilder: (cxt, i) => 
              Card(child: ListTile(title: Text(value[i].name ?? ''),)),
            separatorBuilder: (cxt, i) => Divider(),
            itemCount: value.length),
          ),
        AsyncError(:final error) => Text('error: $error'),
        _ => Center(child: const CircularProgressIndicator(),),
      }
    );
  }
}
