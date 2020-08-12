import 'package:flutter/material.dart';

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo page'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('My new page'),
        ),
      ),
    );
  }
}
