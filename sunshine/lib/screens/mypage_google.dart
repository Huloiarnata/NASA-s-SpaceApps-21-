import 'dart:convert';
import 'package:geolocator/geolocator.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:sunshine/main.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:sunshine/services/auth.dart';
import 'package:sunshine/services/google_sign_in.dart';

import 'package:sunshine/services/geolocation.dart';

void main() => runApp(new MyPage());

class MyPage extends StatelessWidget {
  const MyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/main': (BuildContext context) => new Sunshine(),
          '/geolocation': (BuildContext context) => new Geoapp(),
        },
        // removes the debug tag from the application
        title: 'HACKATHON_APP',
        // title of our application

        home: Mypagescreen());
  }
}

class Mypagescreen extends StatefulWidget {
  const Mypagescreen({key}) : super(key: key);

  @override
  _MypagescreenState createState() => new _MypagescreenState();
}

class _MypagescreenState extends State<Mypagescreen> {
  final AuthService _auth = AuthService();

  get children => null;
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final routeArgs = ModalRoute.of(context)?.settings.arguments;
    var size = MediaQuery.of(context).size;

    return Stack(children: <Widget>[
      Container(
        height: size.height * .72,
        decoration: BoxDecoration(
          color: Color(0xFFA5D6A7),
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      Container(
          padding: EdgeInsets.fromLTRB(20.0, 30.0, 15.0, 0.0),
          child: SizedBox(
            height: 160,
            width: 480,
            child: Material(
              borderRadius: BorderRadius.circular(15.0),
              shadowColor: Colors.greenAccent[300],
              color: Colors.green.shade300,
              child: Container(
                padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 58,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        maxRadius: 55,
                        backgroundImage: NetworkImage(user.photoURL),
                      ),
                    ),
                    SizedBox(width: 13),
                    Container(
                      width: MediaQuery.of(context).size.width * .5,
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 55.0),
                      child: FittedBox(
                        child: Text(
                          'Hello, ' + user.displayName.split(" ")[0] + ' !',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 23.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
      Container(
        padding: EdgeInsets.fromLTRB(160.0, 110.0, 0.0, 0.0),
        child: SizedBox(
            height: 40,
            width: 150,
            child: Material(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.green.shade100,
                child: GestureDetector(
                    onTap: () {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.logout();
                    },
                    child: Center(
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700),
                      ),
                    )))),
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.only(top: 180.0, left: 20.0, right: 20.0),
        height: 330,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              height: 135,
              width: 140,
              child: Card(
                child: Wrap(children: <Widget>[
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed('/subsidy');
                    },
                    title: Text('Government Subsidies\n'),
                    subtitle: Text('Click Here'),
                  ),
                ]),
              ),
            ),
            Container(
              height: 135,
              width: 140,
              child: Card(
                child: Wrap(children: <Widget>[
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed('/power_consumption');
                    },
                    title: Text('Your Power\nConsumption\n'),
                    subtitle: Text('Click Here'),
                  ),
                ]),
              ),
            ),
            // Container(
            //   height: 135,
            //   width: 140,
            //   child: Card(
            //     child: Wrap(children: <Widget>[
            //       ListTile(
            //         onTap: () {},
            //         title: Text('Financial\nIncentives\n'),
            //         subtitle: Text('Click Here'),
            //       ),
            //     ]),
            //   ),
            // ),
            // Container(
            //   height: 135,
            //   width: 140,
            //   child: Card(
            //     child: Wrap(children: <Widget>[
            //       ListTile(
            //         onTap: () {},
            //         title: Text('Energy By \nSolar Panels\n'),
            //         subtitle: Text(
            //           'Click Here',
            //           textAlign: TextAlign.justify,
            //         ),
            //       ),
            //     ]),
            //   ),
            // ),
            Container(
              height: 135,
              width: 140,
              child: Card(
                child: Wrap(children: <Widget>[
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed('/annual_solar_irr');
                    },
                    title: Text('Annual\nSolar Irrandiance\nData'),
                    subtitle: Text('Download'),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.only(top: 330.0, left: 20.0, right: 15.0),
        height: 780,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              height: 100,
              width: 80,
              child: Card(
                child: Wrap(children: <Widget>[
                  ListTile(
                    onTap: () async {},
                    title: Text('Your Current Location:\n'),
                    subtitle: Row(
                      children: [
                        Text('Latitude: ${lat}'),
                        SizedBox(width: 5),
                        Text('Longitude: ${long}'),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            Container(
              height: 100,
              width: 80,
              child: Card(
                child: Wrap(children: <Widget>[
                  ListTile(
                    onTap: () async {
                      Navigator.of(context).pushNamed('/monthly_graph');
                    },
                    title: const Text('Monthly Graphical Solar Irradiance:\n'),
                    subtitle: const Text('Click Here'),
                  ),
                ]),
              ),
            ),
            Container(
              height: 100,
              width: 80,
              child: Card(
                child: Wrap(children: <Widget>[
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed('/solar_pannel');
                    },
                    title:
                        const Text('Want To Know More About\nSolar Panel:\n'),
                    subtitle: const Text('Click Here'),
                  ),
                ]),
              ),
            ),
            Container(
              height: 100,
              width: 80,
              child: Card(
                child: Wrap(children: <Widget>[
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed('/renew_vs_non');
                    },
                    title: Text('Renewable Vs Non-Renewable\n'),
                    subtitle: Text('Click Here'),
                  ),
                ]),
              ),
            ),
            Container(
              height: 100,
              width: 80,
              child: Card(
                child: Wrap(children: <Widget>[
                  ListTile(
                    onTap: () {},
                    title: Text('Download All Data\n(By NASA)\n'),
                    subtitle: Text('Click Here'),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
