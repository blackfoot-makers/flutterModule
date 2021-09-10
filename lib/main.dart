import 'package:flutter/material.dart';
import 'package:flutter_app/first_screen/first_screen.dart';
import 'package:flutter_app/second_screen/second_screen.dart';
import 'package:flutter_app/second_screen/task_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TaskNotifier(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        initialRoute: FirstScreen.id,
        routes: {
          FirstScreen.id: (context) => const FirstScreen(),
          SecondScreen.id: (context) => const SecondScreen(),
        },
      ),
    );
  }
}
