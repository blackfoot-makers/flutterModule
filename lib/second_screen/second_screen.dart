import 'package:flutter/material.dart';
import 'package:flutter_app/constant.dart';
import 'package:flutter_app/second_screen/add_task_screen.dart';
import 'package:flutter_app/second_screen/task_list.dart';
import 'package:flutter_app/second_screen/task_model.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);
  static String id = '/todo';

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final List<TaskModel> _tasks = <TaskModel>[];

  void _addTask(String task) {
    setState(() {
      _tasks.add(TaskModel(task));
    });
  }

  void _toggleTask(TaskModel task) {
    setState(() {
      task.toogle();
    });
  }

  void _deleteTask(TaskModel task) {
    setState(() {
      _tasks.remove(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      floatingActionButton: _AddTaskFAB(
        addTask: _addTask,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _TaskScreenHeader(tasks: _tasks),
            _TaskScreenBody(
              tasks: _tasks,
              toggleTask: _toggleTask,
              deleteTask: _deleteTask,
            ),
          ],
        ),
      ),
    );
  }
}

class _AddTaskFAB extends StatelessWidget {
  const _AddTaskFAB({
    Key? key,
    required this.addTask,
  }) : super(key: key);

  final Function(String) addTask;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet<AddTaskScreen>(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: AddTaskScreen(
                addTask: addTask,
              ),
            ),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}

class _TaskScreenHeader extends StatelessWidget {
  const _TaskScreenHeader({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 40,
              child: Icon(
                Icons.arrow_back,
                color: Colors.teal,
                size: 60,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'TODO',
            style: kTextStyle.copyWith(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
          Text(
            '${tasks.length} Tasks',
            style: kTextStyle.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _TaskScreenBody extends StatelessWidget {
  const _TaskScreenBody({
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
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: TaskList(
          tasks: tasks,
          toggleTask: toggleTask,
          deleteTask: deleteTask,
        ),
      ),
    );
  }
}
