import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:sunshine/screens/hompage.dart';

void main() => runApp(new Geoapp());

class Geoapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Geoapppage(),
    );
  }
}

class Geoapppage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GeoapppageState();
}

String lat, long;
void getCurretPosition() async {
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    LocationPermission asked = await Geolocator.requestPermission();
    print('Permission not given');
  } else {
    Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    print('Latitude: ' + currentPosition.latitude.toString());
    print('Longitude: ' + currentPosition.longitude.toString());
    lat = currentPosition.latitude.toString();
    long = currentPosition.longitude.toString();
  }
}

class _GeoapppageState extends State<Geoapppage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: ElevatedButton(
              child: Text('Get Your Location'),
              onPressed: () {
                getCurretPosition();
                Navigator.of(context, rootNavigator: true).pop(context);

                //if this is not poping us back to the Homepage import library and and direct it to Homepage()
              },
            ),
          ),
        ),
      ),
    );
  }
}
