import 'package:flutter_app/second_screen/task_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Task', () {
    const String taskName = 'my task';
    late TaskModel task;

    setUp(() {
      task = TaskModel(taskName);
    });

    tearDown(() {
      task = TaskModel('');
    });

    test('Task should have good text and be undone by default', () {
      expect(task.text, taskName);
      expect(task.done, false);
    });

    test('First toggle should set to done', () {
      task.toogle();
      expect(task.done, true);
    });

    test('Two toggle should reset to false', () {
      task.toogle();
      task.toogle();
      expect(task.done, false);
    });
  });
}
