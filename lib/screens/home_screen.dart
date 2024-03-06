import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_test_nasari_mobile/models/edit_todo_arguments.dart';
import 'package:technical_test_nasari_mobile/models/todo.dart';
import 'package:technical_test_nasari_mobile/providers/todo_provider.dart';
import 'package:technical_test_nasari_mobile/widgets/todo_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, todoProvider, _) {
          List<Todo> todoList = todoProvider.todos;
          return ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              final todo = todoList[index];
              return TodoItem(
                todo: todo,
                onCheckboxChanged: (value) {
                  todoProvider.toggleTodoComplete(index);
                },
                onEditPressed: () {
                  _navigateToEditScreen(context, index, todo);
                },
                onDeletePressed: () {
                  todoProvider.deleteTodo(index);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            "/addTodo",
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _navigateToEditScreen(BuildContext context, int index, Todo todo) {
    Navigator.pushNamed(
      context,
      "/editTodo",
      arguments: EditTodoArguments(index: index, todo: todo),
    );
  }
}
