import 'package:classwork/model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClient {
  ApiClient();

  Future<List<User>> getUser() async {
    var _uri = Uri.https('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(_uri);
    List<dynamic> jsonList = json.decode(response.body);
    List<User> userList =
      jsonList.map((userJson) => User.fromJson(userJson)).toList();
    return userList;
  }
}
