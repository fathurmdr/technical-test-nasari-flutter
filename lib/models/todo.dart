class Todo {
  String title;
  String description;
  DateTime deadline;
  bool completed;

  Todo({
    required this.title,
    required this.description,
    required this.deadline,
    this.completed = false,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'],
      description: json['description'],
      deadline: DateTime.parse(json['deadline']),
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'deadline': deadline.toIso8601String(),
      'completed': completed,
    };
  }
}
