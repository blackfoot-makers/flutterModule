import 'package:flutter/material.dart';
import 'package:flutter_app/constant.dart';
import 'package:flutter_app/first_screen/avatar.dart';
import 'package:flutter_app/first_screen/location.dart';
import 'package:flutter_app/first_screen/my_card.dart';
import 'package:flutter_app/second_screen/second_screen.dart';
import 'package:flutter_app/second_screen/task_model.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  static String id = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Avatar(),
            const Text(
              'Nicolas Thing-leoh',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',
              ),
            ),
            Text(
              'MOBILE DEVELOPPER',
              style: kTextStyle,
            ),
            Text(
              '${context.watch<TaskNotifier>().count} number of Tasks',
              style: kTextStyle,
            ),
            SizedBox(
              height: 20,
              width: 150,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            const MyCard(
              icon: Icons.phone,
              title: '+33 7 83 67 93 51',
            ),
            const MyCard(
              icon: Icons.email,
              title: 'nicolas@blackfoot.io',
            ),
            InkWell(
              child: const Location(),
              key: const Key('goToTaskPageButton'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  SecondScreen.id,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
