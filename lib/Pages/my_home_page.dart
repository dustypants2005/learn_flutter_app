import 'package:flutter/material.dart';
import 'package:learn_flutter_app/Models/todo.dart';
import 'package:learn_flutter_app/Pages/create_todo.dart';
import 'package:learn_flutter_app/widgets/todo_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> todos = [
    const Todo('thing 1'),
    const Todo('thing 2'),
    const Todo('not like the others'),
  ];

  Future<void> createTodo(BuildContext context) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const CreateTodo()));
    if (result is Todo) {
      todos.add(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: todos.map((todo) {
            return TodoCard(title: todo.title);
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createTodo(context);
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
