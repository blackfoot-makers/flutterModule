import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(
      {@required this.text,
      @required this.checkboxState,
      this.onPress,
      this.onLongPress})
      : assert(text != null),
        assert(checkboxState != null);

  final String text;
  final bool checkboxState;
  final Function(bool) onPress;
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
        onChanged: (bool change) {
          if (onPress != null) {
            onPress(change);
          }
        },
        activeColor: Colors.teal,
      ),
    );
  }
}
