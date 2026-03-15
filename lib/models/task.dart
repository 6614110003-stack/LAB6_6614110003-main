class Task {
  final String id;
  final String title;
  final String? description;
  final DateTime? dueDate;
  final String category;
  final bool isCompleted;

  Task({
    required this.id,
    required this.title,
    this.description,
    this.dueDate,
    this.category = 'General',
    this.isCompleted = false,
  });

  Task copyWith({
    String? title,
    String? description,
    DateTime? dueDate,
    String? category,
    bool? isCompleted,
  }) {
    return Task(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      category: category ?? this.category,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}