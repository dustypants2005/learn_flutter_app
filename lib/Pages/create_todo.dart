import 'package:flutter/material.dart';
import 'package:learn_flutter_app/Models/todo.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({super.key});

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  final todoFormKey = GlobalKey<FormState>();

  String title = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Todo'),
      ),
      body: Form(
        key: todoFormKey,
        child: Card(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter a title...',
                ),
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Cant be empty'
                      : null;
                },
                onSaved: (value) {
                  title = value!;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  todoFormKey.currentState!.validate();
                  todoFormKey.currentState!.save();
                  Navigator.pop(context, Todo(title));
                  todoFormKey.currentState!.reset();
                },
                child: const Text('Save'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
