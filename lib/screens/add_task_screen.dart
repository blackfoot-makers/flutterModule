import 'package:flutter/material.dart';
import 'package:flutter_app/models/tasks_notifier.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  void onPress(BuildContext context, String text) {
    context.read<TasksNotifier>().addTask(text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    String _text;

    return Container(
        color: const Color(0xff757575),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 30,
                  ),
                ),
                TextField(
                  textAlign: TextAlign.center,
                  autofocus: true,
                  onChanged: (String value) {
                    _text = value;
                  },
                  onSubmitted: (String text) => onPress(context, text),
                ),
                const SizedBox(
                  height: 20,
                ),
                FlatButton(
                  onPressed: () => onPress(context, _text),
                  color: Colors.teal,
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
        ));
  }
}
