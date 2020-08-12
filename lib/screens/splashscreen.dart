import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/widgets/location.dart';
import 'package:flutter_app/screens/todoscreen.dart';
import '../widgets/avatar.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Avatar(),
            Text(
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
            SizedBox(
              height: 20,
              width: 150,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                title: Text(
                  '+33 7 83 67 91 51',
                  style: kTextStyle.copyWith(
                    color: Colors.teal.shade900,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
                title: Text(
                  'nicolas@blackfoot.io',
                  style: kTextStyle.copyWith(
                    color: Colors.teal.shade900,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TodoScreen(),
                  ),
                );
              },
              child: Location(),
            )
          ],
        ),
      ),
    );
  }
}
