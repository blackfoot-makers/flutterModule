import 'dart:collection';

import 'package:flutter/foundation.dart';

class TaskModel {
  TaskModel(this.text) : _done = false;

  final String text;
  bool _done;

  bool get done => _done;

  void toogle() {
    _done = !_done;
  }
}

class TaskNotifier with ChangeNotifier {
  late List<TaskModel> _tasks;

  TaskNotifier({
    List<TaskModel>? tasks,
  }) {
    if (tasks == null) {
      _tasks = <TaskModel>[];
    } else {
      _tasks = tasks;
    }
  }

  int get count => _tasks.length;

  UnmodifiableListView<TaskModel> get tasks => UnmodifiableListView(_tasks);

  void addTask(String task) {
    _tasks.add(TaskModel(task));
    notifyListeners();
  }

  void toggleTask(TaskModel task) {
    task.toogle();
    notifyListeners();
  }

  void deleteTask(TaskModel task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
