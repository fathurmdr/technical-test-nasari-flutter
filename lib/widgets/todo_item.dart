import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:technical_test_nasari_mobile/models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function(bool?) onCheckboxChanged;
  final VoidCallback onEditPressed;
  final VoidCallback onDeletePressed;

  const TodoItem({
    required this.todo,
    required this.onCheckboxChanged,
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(todo.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(todo.description),
            Text(
                'Deadline: ${DateFormat('dd MMMM yyyy HH:mm').format(todo.deadline)}'), // Tampilkan deadline
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: todo.completed,
              onChanged: onCheckboxChanged,
            ),
            IconButton(
              icon: Icon(Icons.edit), // Tombol "Edit"
              onPressed: onEditPressed, // Panggil fungsi callback
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDeletePressed,
            ),
          ],
        ),
      ),
    );
  }
}
