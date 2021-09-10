import 'package:flutter/material.dart';
import 'package:flutter_app/second_screen/task_model.dart';

class _TaskTile extends StatelessWidget {
  const _TaskTile({
    Key? key,
    required this.text,
    required this.checkboxState,
    this.onPress,
    required this.onLongPress,
  }) : super(key: key);

  final String text;
  final bool checkboxState;
  final Function(bool?)? onPress;
  final Function() onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: CheckboxListTile(
        title: Text(
          text,
          style: TextStyle(
            decoration: checkboxState ? TextDecoration.lineThrough : null,
          ),
        ),
        value: checkboxState,
        onChanged: (bool? change) {
          if (onPress != null) {
            onPress!(change);
          }
        },
        activeColor: Colors.teal,
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.tasks,
    required this.toggleTask,
    required this.deleteTask,
  }) : super(key: key);

  final List<TaskModel> tasks;
  final Function(TaskModel) toggleTask;
  final Function(TaskModel) deleteTask;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        final TaskModel? task = tasks[index];
        if (task == null) {
          return Container();
        }

        return _TaskTile(
          text: task.text,
          checkboxState: task.done,
          onPress: (bool? changed) {
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
