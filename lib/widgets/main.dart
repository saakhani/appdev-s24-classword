import 'package:flutter/material.dart';
import 'package:./lib/models/albums_model.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
        useMaterial3: false,
      ),
      darkTheme: ThemeData.dark(),
      home: const Login(title: 'Login'),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key, required this.title});

  final String title;

  @override
  State<Login> createState() => UserScreenState();
}

//list view builder only renders those that are being displayed on screen
// thats why its preferred to normals rows and columns

class UserScreenState extends State<Login> {
  Future<List<Albums>> fetchAlbums() async {
    Uri uriObject = Uri.parse('https://jsonplaceholder.typicode.com/albums');
    final response = await http.get(uriObject);
    
    if (response.statusCode == 200){

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/catpic.jpeg"),
                    ),
                    title: Text(index.toString()),
                    subtitle: const Text("hello"),
                  ),
                );
              })),
    );
  }
}