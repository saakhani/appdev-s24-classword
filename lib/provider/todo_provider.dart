import 'package:classwork/model/todo.dart';
import 'package:classwork/service/todo_service.dart';
import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  final _service = TodoService();
  bool isLoading = false;
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;
  
  Future<void> getAllTodos() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAllTodos();

    _todos = response;
    isLoading = false;
    notifyListeners();
  }
}