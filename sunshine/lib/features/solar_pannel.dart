import 'package:flutter/material.dart';

void main() => runApp(const SolarApp());

class SolarApp extends StatelessWidget {
  const SolarApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.green.shade100,
      home: Scaffold(
        body: const MyStatelessWidget(),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        margin: EdgeInsets.symmetric(vertical: 20),
        // padding: EdgeInsets.only(top: 180.0, left: 20.0, right: 20.0),
        height: 650,
        child: ListView(scrollDirection: Axis.vertical, children: [
          Container(
            padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 15.0),
            height: 600,
            width: 80,
            child: Card(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                    onTap: () async {},
                    title: Text(' About Solar Panel: '),
                    subtitle: Text(
                        'When photons hit a solar cell, they knock electrons loose from their atoms. If conductors are attached to the positive and negative sides of a cell, it forms an electrical circuit. When electrons flow through such a circuit, they generate electricity. Multiple cells make up a solar panel, and multiple panels can be wired together to form a solar array. The more panels you can deploy, the more energy you can expect to generate.\n PV solar panels generate DC electricity. With DC electricity, electrons flow in one direction around a circuit. This example shows a battery powering a light bulb. The electrons move from the negative side of the battery, through a lamp, and return to the positive side of the battery.\n With AC electricity, electrons are pushed and pulled, periodically reversing direction, much like the cylinder of a car engine. Generators create AC electricity when a coil of wire is spun next to a magnet. Many different energy sources can turn the handle of this generator, such as gas or diesel fuel, hydroelectricity, nuclear, coal, wind, or solar.'),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    ]);
  }
}
