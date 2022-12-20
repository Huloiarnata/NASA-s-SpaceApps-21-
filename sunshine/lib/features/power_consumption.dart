// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'dart:ffi';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:sunshine/main.dart';

void main() => runApp(new Powerconsumption());

class Powerconsumption extends StatelessWidget {
  const Powerconsumption({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return new MaterialApp(
        color: Colors.green.shade100,
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/main': (BuildContext context) => new Sunshine()
        },
        // removes the debug tag from the application
        title: 'HACKATHON_APP', // title of our application
        home: Powerconsumptionscreen());
  }
}

class Powerconsumptionscreen extends StatefulWidget {
  const Powerconsumptionscreen({Key key}) : super(key: key);

  @override
  _PowerconsumptionscreenState createState() =>
      new _PowerconsumptionscreenState();
}

class _PowerconsumptionscreenState extends State<Powerconsumptionscreen> {
  @override
  Widget build(BuildContext context) {
    int vol, current, time, power;
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
                    'Calculate\nPower(KW/hr)',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontFamily: 'sticks',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(300.0, 70.0, 0.0, 0.0),
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
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          labelText: 'Device Voltage:',
                          hintText: 'In Voltage',
                          labelStyle: TextStyle(
                            fontSize: 25.0,
                            fontFamily: 'sticks',
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF35FF07))),
                        ),
                        onChanged: (Value) {
                          // print(${Value});
                          // vol = Value;
                        },
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
                          labelText: 'Device Current:',
                          hintText: 'In Ampere',
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
                          labelText: 'Time device is used',
                          hintText: 'In Hours',
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
                                'Total Consumption',
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
                              'Back To Home',
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
