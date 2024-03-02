import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/album_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AlbumsScreen(),
    );
  }
}

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({super.key});

  @override
  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  late Future<List<Album>> _futureAlbumsList;

  void _openModal(Album album) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Center(child: Text(album.title)),
            ),
          ],
        );
      },
    );
  }

  Future<List<Album>> _fetchAlbums() async {
    Uri uriObject = Uri.parse('https://jsonplaceholder.typicode.com/albums');

    final response = await http.get(uriObject);

    if (response.statusCode == 200) {
      List<dynamic> parsedListJson = jsonDecode(response.body);

      List<Album> albumsList = parsedListJson
          .map<Album>((dynamic user) => Album.fromJson(user))
          .toList();

      return albumsList;
    } else {
      throw Exception('Failed to load albums');
    }
  }

  @override
  void initState() {
    super.initState();

    _futureAlbumsList = _fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: FutureBuilder(
          future: _futureAlbumsList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var album = snapshot.data![index];

                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(album.id.toString()),
                      ),
                      title: Text(album.title),
                      onTap: () => _openModal(album),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
