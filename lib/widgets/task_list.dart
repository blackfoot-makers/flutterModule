import 'package:flutter/material.dart';
import 'package:flutter_app/models/task.dart';
import 'package:flutter_app/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    @required this.tasks,
    @required this.toggleTask,
    @required this.deleteTask,
  })  : assert(tasks != null),
        assert(toggleTask != null),
        assert(deleteTask != null);

  final List<Task> tasks;
  final Function(Task) toggleTask;
  final Function(Task) deleteTask;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        final Task task = tasks[index];
        if (task == null) {
          return null;
        }

        return TaskTile(
          text: task.text,
          checkboxState: task.isDone,
          onPress: (bool changed) {
            toggleTask(task);
          },
          onLongPress: () {
            deleteTask(task);
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}
