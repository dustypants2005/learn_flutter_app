import 'package:flutter/material.dart';
import 'package:learn_flutter_app/Models/todo.dart';
import 'package:learn_flutter_app/Pages/create_todo.dart';
import 'package:learn_flutter_app/main.dart';
import 'package:learn_flutter_app/widgets/todo_card.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> createTodo(TodoModel model) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const CreateTodo()));
    if (result is Todo) {
      model.add(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<TodoCard> getTodos = context.watch<TodoModel>().todos.map((todo) {
      return TodoCard(title: todo.title);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: getTodos,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createTodo(context.read<TodoModel>());
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
