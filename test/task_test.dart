// Import the test package and task class
import 'package:flutter_app/models/task.dart';
import 'package:test/test.dart';

void main() {
  group('Task', () {
    const String task_name = 'my task';
    Task task;

    setUp(() {
      task = Task(task_name);
    });

    tearDown(() {
      task = null;
    });

    test('Task should have good text and be undone by default', () {
      expect(task.text, task_name);
      expect(task.isDone, false);
    });

    test('First toggle should set to done', () {
      task.toggle();
      expect(task.isDone, true);
    });

    test('Two toggle should reset to false', () {
      task.toggle();
      task.toggle();
      expect(task.isDone, false);
    });
  });
}
