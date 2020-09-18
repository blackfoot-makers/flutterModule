import 'package:flutter/material.dart';
import 'package:flutter_app/models/task.dart';
import 'package:flutter_app/models/tasks_notifier.dart';
import 'package:flutter_app/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksNotifier>(
      builder:
          (BuildContext context, TasksNotifier tasksNotifier, Widget child) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            final Task task = tasksNotifier.tasks[index];
            if (task == null) {
              return null;
            }

            return TaskTile(
              text: task.text,
              checkboxState: task.isDone,
              onPress: (bool changed) {
                tasksNotifier.toggleTask(task);
              },
              onLongPress: () {
                tasksNotifier.deleteTask(task);
              },
            );
          },
          itemCount: tasksNotifier.tasksCount,
        );
      },
    );
  }
}
