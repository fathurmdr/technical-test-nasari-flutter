import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technical_test_nasari_mobile/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  Future<void> loadTodosFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? todoListJson = prefs.getStringList('todos');
    if (todoListJson != null) {
      _todos =
          todoListJson.map((json) => Todo.fromJson(jsonDecode(json))).toList();
      notifyListeners();
    }
  }

  Future<void> saveTodosToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> todoListJson =
        _todos.map((todo) => jsonEncode(todo.toJson())).toList();
    prefs.setStringList('todos', todoListJson);
  }

  void addTodo(Todo todo) {
    _todos.add(todo);
    saveTodosToSharedPreferences();
    notifyListeners();
  }

  void editTodo(int index, Todo editedTodo) {
    _todos[index] = editedTodo;
    saveTodosToSharedPreferences();
    notifyListeners();
  }

  void toggleTodoComplete(int index) {
    _todos[index].completed = !_todos[index].completed;
    saveTodosToSharedPreferences();
    notifyListeners();
  }

  void deleteTodo(int index) {
    _todos.removeAt(index);
    saveTodosToSharedPreferences();
    notifyListeners();
  }
}
