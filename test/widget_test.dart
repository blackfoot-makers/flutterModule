// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_app/models/task.dart';
import 'package:flutter_app/models/tasks_notifier.dart';
import 'package:flutter_app/widgets/task_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Task list smoke test', (WidgetTester tester) async {
    // Create test list
    List<Task> taskList = <Task>[
      new Task('First task'),
      new Task('Second task'),
      new Task('Task done')
    ];
    taskList[2].toggle();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChangeNotifierProvider<TasksNotifier>(
            create: (BuildContext context) => TasksNotifier(tasks: taskList),
            child: TaskList(),
          ),
        ),
      ),
    );

    final firstTask = find.text(taskList[0].text, skipOffstage: false);
    final secondTask = find.text(taskList[1].text);
    final doneTask = find.text(taskList[2].text);
    // Verify that our counter starts at 0.
    expect(firstTask, findsOneWidget);
    expect(secondTask, findsOneWidget);
    expect(doneTask, findsOneWidget);

    // Tap the done task
    await tester.tap(doneTask);
    await tester.pump();

    // Verify that our isdone is false.
    expect(taskList[2].isDone, false);
  });
}
