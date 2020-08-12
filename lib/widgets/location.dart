import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:flutter_app/constants.dart';

const String kApiUrl = 'https://api-adresse.data.gouv.fr/reverse/';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String _position = 'Getting position...';

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<dynamic> getData(Position position) async {
    Response response = await get(
        '$kApiUrl?lat=${position.latitude}&lon=${position.longitude}');
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      print(response.body);
    }
  }

  void getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
    dynamic data = await getData(position);
    if (data != null) {
      setState(() {
        _position = data['features'][0]['properties']['label'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      key: Key('goToTaskPageButton'),
      onPressed: () {
        Navigator.of(context).pushNamed('/todo');
      },
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text(
          _position,
          style: kTextStyle,
        ),
      ),
    );
  }
}
