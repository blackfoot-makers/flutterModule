import 'package:flutter/material.dart';
import 'package:flutter_app/constant.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Second screen',
          style: kTextStyle,
        ),
      ),
      body: const Center(
        child: Text('New page'),
      ),
    );
  }
}
