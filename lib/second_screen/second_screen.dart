import 'package:flutter/material.dart';
import 'package:flutter_app/constant.dart';
import 'package:flutter_app/second_screen/add_task_screen.dart';
import 'package:flutter_app/second_screen/task_list.dart';
import 'package:flutter_app/second_screen/task_model.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);
  static String id = '/todo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      floatingActionButton: const _AddTaskFAB(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            _TaskScreenHeader(),
            _TaskScreenBody(),
          ],
        ),
      ),
    );
  }
}

class _AddTaskFAB extends StatelessWidget {
  const _AddTaskFAB({
    Key? key,
  }) : super(key: key);

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
              child: const AddTaskScreen(),
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
  }) : super(key: key);

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
            '${context.watch<TaskNotifier>().count} Tasks',
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
  }) : super(key: key);

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
        child: const TaskList(),
      ),
    );
  }
}
