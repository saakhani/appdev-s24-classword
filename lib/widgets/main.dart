import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/album_model.dart';
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
      home: const UsersScreen(title: 'Login'),
    );
  }
}

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key, required this.title});

  final String title;

  @override
  State<UsersScreen> createState() => UserScreenState();
}

//list view builder only renders those that are being displayed on screen
// thats why its preferred to normals rows and columns

class UserScreenState extends State<UsersScreen> {
  //late will throw error when used before assigning
  late Future<List<Albums>> futureAlbumsList;

  Future<List<Albums>> fetchAlbums() async {
    Uri uriObject = Uri.parse('https://jsonplaceholder.typicode.com/albums');
    final response = await http.get(uriObject);

    if (response.statusCode == 200) {
      List<dynamic> parseListJson = jsonDecode(response.body);

      //cant access by iterable through index
      List<Albums> items = List<Albums>.from(
        //map returns and interable
        parseListJson.map<Albums>((dynamic user) => Albums.fromJson(user)),
      );

      //.from is more optimized than .tolist()

      return items;
    } else {
      throw Exception('Failed to load album');
    }
  }

  //load the widget before do this stuff
  @override
  void initState() {
    super.initState();

    futureAlbumsList = fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
        future: futureAlbumsList,
        //snapshot is the curret state of the data

        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  var user = snapshot.data![index];
                  return Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage('https://images.pexels.com/photos/9248672/pexels-photo-9248672.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      ),
                      title: Text(user.title),
                      subtitle: Text(index.toString()),
                      // onTap: () {
                      //   showMaterialModalBottomSheet(
                      //     context: context,
                      //     builder: (context) => Container(
                      //       child: Column(
                      //         children: [
                      //           Text(user.title),
                      //           Text(user.id.toString()),
                      //         ],
                      //       ),
                      //     ),
                      //   );
                      // },
                    ),
                  );
                });
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          return const CircularProgressIndicator();
        },
      )),
    );
  }
}