import 'package:flutter/material.dart';
import 'package:flutter_app/constant.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.teal,
        ),
        title: Text(
          title,
          style: kTextStyle.copyWith(
            color: Colors.teal.shade900,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
