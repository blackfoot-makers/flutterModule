import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/constant.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

const String _apiUrl = 'https://api-adresse.data.gouv.fr';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String _postion = 'Loading...';

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    final Position position = await _determinePosition();
    final String address = await _getData(position);
    setState(() {
      _postion = address;
    });
  }

  Future<String> _getData(Position postion) async {
    final http.Response response = await http.get(Uri.parse(
      '$_apiUrl/reverse/?lon=${postion.longitude}&lat=${postion.latitude}',
    ));
    if (response.statusCode == 200) {
      Map<String, dynamic> res = jsonDecode(response.body);
      return res['features'][0]['properties']['label'];
    }
    return 'An error occured ${response.statusCode}';
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        _postion,
        style: kTextStyle,
      ),
    );
  }
}
