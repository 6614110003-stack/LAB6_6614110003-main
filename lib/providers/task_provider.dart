import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskProvider extends ChangeNotifier {
  final List _tasks = [
    Task(
      id: '1',
      title: 'Learn Material Design 3',
      description: 'Study color system, typography, and components',
      category: 'Learning',
      dueDate: DateTime.now().add(const Duration(days: 2)),
    ),
    Task(
      id: '2',
      title: 'Build Flutter App',
      category: 'Work',
      dueDate: DateTime.now().add(const Duration(days: 5)),
    ),
    Task(
      id: '3',
      title: 'Review documentation',
      category: 'Learning',
      isCompleted: true,
    ),
  ];

  List get tasks => _tasks;
  List get pendingTasks => 
      _tasks.where((t) => !t.isCompleted).toList();
  List get completedTasks => 
      _tasks.where((t) => t.isCompleted).toList();

  void addTask(Task task) {
    _tasks.insert(0, task);
    notifyListeners();
  }

  void toggleTask(String id) {
    final index = _tasks.indexWhere((t) => t.id == id);
    if (index != -1) {
      _tasks[index] = _tasks[index].copyWith(
        isCompleted: !_tasks[index].isCompleted,
      );
      notifyListeners();
    }
  }

  void deleteTask(String id) {
    _tasks.removeWhere((t) => t.id == id);
    notifyListeners();
  }
}