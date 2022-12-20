// ignore_for_file: prefer_const_constructors, unused_import, use_key_in_widget_constructors, unnecessary_new
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:sunshine/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sunshine/services/google_sign_in.dart';
import 'mypage_anonymous.dart';
import 'package:geolocator/geolocator.dart';
import 'mypage_google.dart';
import 'package:sunshine/services/geolocation.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => new _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final AuthService _auth = AuthService();

  get children => null;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Stack(children: <Widget>[
      Container(
        height: size.height * .60,
        decoration: BoxDecoration(
          color: Color(0xFFA5D6A7),
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(30.0, 115.0, 0.0, 0.0),
        child: Text(
          'HELLO',
          style: TextStyle(
            fontSize: 90.0,
            fontWeight: FontWeight.w700,
            color: Color(0xFF000000),
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(30.0, 215.0, 0.0, 0.0),
        child: Text(
          'THERE',
          style: TextStyle(
            fontSize: 90.0,
            fontWeight: FontWeight.w700,
            color: Color(0xFF000000),
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(313.0, 155.0, 0.0, 0.0),
        child: Text(
          '.',
          style: TextStyle(
            fontSize: 150.0,
            fontFamily: 'sticks',
            fontWeight: FontWeight.w700,
            color: Color(0xFFC8E6C9),
          ),
        ),
      ),
      Column(children: <Widget>[
        Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 387.0),
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 75,
                    width: 300,
                    child: Material(
                      borderRadius: BorderRadius.circular(60.0),
                      shadowColor: Colors.greenAccent[500],
                      color: Colors.green.shade100,
                      elevation: 20.0,
                      child: GestureDetector(
                        onTap: () async {
                          Position currentPosition =
                              await Geolocator.getCurrentPosition(
                                  desiredAccuracy: LocationAccuracy.best);
                          Navigator.of(context).pushNamed('/geolocation');
                        },
                        child: Center(
                          child: Text(
                            'FIND LOCATION',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: Text(
                      'THEN',
                      style: TextStyle(
                        fontSize: 24.5,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15.0),
                  color: Colors.transparent,
                  child: SizedBox(
                    height: 75,
                    width: 300,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: FittedBox(
                              child: Image(
                                image: AssetImage('images/google_logo.jpg'),
                                fit: BoxFit.fill,
                                height: 54,
                                width: 70,
                              ),
                            ),
                          ),
                          SizedBox(width: 2.0),
                          InkWell(
                            onTap: () async {
                              if (lat == null && long == null) {
                                Position currentPosition =
                                    await Geolocator.getCurrentPosition(
                                        desiredAccuracy: LocationAccuracy.best);
                                Navigator.of(context).pushNamed('/geolocation');
                              } else {
                                final provider =
                                    Provider.of<GoogleSignInProvider>(context,
                                        listen: false);
                                provider.googleLogin();
                              }
                            },
                            child: Center(
                              child: Text(
                                'LOG IN WITH GOOGLE',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ])
    ]);
  }
}
