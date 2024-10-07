import 'package:flutter/material.dart';

class Todo {
  final String title;

  const Todo(this.title);
}

class TodoModel extends ChangeNotifier {
  final List<Todo> todos = [];

  void add(Todo todo) {
    todos.add(todo);
  }

  void remove(Todo todo) {
    todos.remove(todo);
  }
}
