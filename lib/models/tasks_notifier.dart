import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter_app/models/task.dart';

class TasksNotifier extends ChangeNotifier {
  List<Task> _tasks = <Task>[];

  TasksNotifier({List<Task> tasks}) {
    this._tasks = tasks ?? [];
  }

  UnmodifiableListView<Task> get tasks => UnmodifiableListView<Task>(_tasks);

  int get tasksCount => _tasks.length;

  void addTask(String name) {
    if (name != null) {
      _tasks.add(Task(name));
      notifyListeners();
    }
  }

  void deleteTask(Task task) {
    if (task != null) {
      _tasks.remove(task);
      notifyListeners();
    }
  }

  void toggleTask(Task task) {
    if (task != null) {
      task.toggle();
      notifyListeners();
    }
  }
}
