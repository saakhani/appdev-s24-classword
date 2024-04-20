import 'package:classwork/model/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
Future<List<User>> user(UserRef ref) async {
  final uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
  final response = await http.get(uri);
  List<dynamic> jsonList = json.decode(response.body);
  List<User> userList =
      jsonList.map((userJson) => User.fromJson(userJson)).toList();
  return userList;
}
