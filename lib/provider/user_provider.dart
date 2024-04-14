import 'package:classwork/model/user.dart';
import 'package:classwork/service/user_service.dart';


import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final _service = UserService();
  bool isLoading = false;
  List<User> _users = [];
  List<User> get users => _users;
  Future<void> getAllTodos() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAllUsers();

    _users = response;
    isLoading = false;
    notifyListeners();
  }
}