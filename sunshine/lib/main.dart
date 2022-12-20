// ignore_for_file: prefer_const_constructors, unused_import, unnecessary_new
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:sunshine/features/power_consumption.dart';
import 'package:sunshine/services/geolocation.dart';
import 'package:sunshine/services/google_sign_in.dart';
import './screens/hompage.dart';
import './screens/forgotpassword.dart';
import 'features/renew_vs_non.dart';
import 'features/solar_pannel.dart';
import 'features/subsidy.dart';
import 'screens/mypage_google.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/annual_solar_irr.dart';
import 'features/monthly_graph.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new Sunshine());
}

class Sunshine extends StatelessWidget {
  const Sunshine({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/mypage_anonymous': (BuildContext context) => new MyPage(),
          '/main': (BuildContext context) => new Sunshine(),
          '/geolocation': (BuildContext context) => new Geoapp(),
          '/annual_solar_irr': (BuildContext context) => new MyApp(),
          '/solar_pannel': (BuildContext context) => new SolarApp(),
          '/renew_vs_non': (BuildContext context) => new RenewApp(),
          '/power_consumption': (BuildContext context) =>
              new Powerconsumption(),
          '/subsidy': (BuildContext context) => new SubsidyApp(),
          '/monthly_graph': (BuildContext context) => new ChartApp(),
        }, // removes the debug tag from the application
        title: 'HACKATHON_APP', // title of our application
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: ChangeNotifierProvider(
            create: (context) => GoogleSignInProvider(),
            child: StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    return Mypagescreen();
                  } else if (snapshot.hasError) {
                    String lat = null, long = null;
                    return Center(child: Text('Something went wrong'));
                  } else {
                    return Homescreen();
                  }
                }),
          ),
        ));
  }
}
