// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:sunshine/main.dart';

void main() => runApp(new ForgetpassPage());

class ForgetpassPage extends StatelessWidget {
  const ForgetpassPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/main': (BuildContext context) => new Sunshine()
        },
        // removes the debug tag from the application
        title: 'HACKATHON_APP', // title of our application
        home: Forgetpassscreen());
  }
}

class Forgetpassscreen extends StatefulWidget {
  const Forgetpassscreen({Key key}) : super(key: key);

  @override
  _ForgetpassscreenState createState() => new _ForgetpassscreenState();
}

class _ForgetpassscreenState extends State<Forgetpassscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(30.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'RESET PASSWORD',
                    style: TextStyle(
                      fontSize: 70.0,
                      fontFamily: 'sticks',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(330.0, 112.0, 0.0, 0.0),
                  child: Text(
                    '.',
                    style: TextStyle(
                      fontSize: 160.0,
                      fontFamily: 'sticks',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF35FF07),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.only(top: 280.0, left: 30.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Nickname :',
                          labelStyle: TextStyle(
                            fontSize: 25.0,
                            fontFamily: 'sticks',
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF35FF07))),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 23.0,
                ),
                Container(
                  padding: EdgeInsets.only(top: 360.0, left: 30.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Email :',
                          labelStyle: TextStyle(
                            fontSize: 25.0,
                            fontFamily: 'sticks',
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF35FF07))),
                        ),
                      ),
                      SizedBox(
                        height: 23.0,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Mobile No. :',
                          labelStyle: TextStyle(
                            fontSize: 25.0,
                            fontFamily: 'sticks',
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF35FF07))),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 60.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(30.0),
                          shadowColor: Colors.greenAccent[300],
                          color: Colors.greenAccent[700],
                          elevation: 14.0,
                          child: GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: Text(
                                'Send OTP',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Center(
                          child: InkWell(
                            child: Text(
                              'Back To Login',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'sticks',
                                fontWeight: FontWeight.w100,
                                color: Colors.green,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
