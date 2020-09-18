import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

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
    final Response response = await get(
        '$kApiUrl?lat=${position.latitude}&lon=${position.longitude}');
    if (response.statusCode == 200) {
      final String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      print(response.body);
    }
  }

  Future<void> getLocation() async {
    final Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    final dynamic data = await getData(position);
    if (data != null) {
      setState(() {
        _position = data['features'][0]['properties']['label'] as String;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Text(
        _position,
        style: kTextStyle,
      ),
    );
  }
}
