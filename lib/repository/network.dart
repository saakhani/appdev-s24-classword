import 'package:classwork/model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClient {
  ApiClient();

  Future<User> getUser() async {
    var _uri = Uri.https('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(_uri);
    final parsed = jsonDecode(response.body)[0];
    final user = User.fromJson(parsed);
    return user;
  }
}
