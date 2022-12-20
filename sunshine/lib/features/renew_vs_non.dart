import 'package:flutter/material.dart';

void main() => runApp(const RenewApp());

class RenewApp extends StatelessWidget {
  const RenewApp({Key key}) : super(key: key);

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
                    title: Text(' Renewable vs Nonn-Renewable'),
                    subtitle: Text(
                        "There are two types of natural resources.\nThe first are renewable natural resources.\nThey are called renewable because they\n can grow again or never run out. The second are\ncalled nonrenewable natural resources.\nThese are things that can run out or be used up.\nThey usually come from the ground.\n Let us look more closely at renewable\nnatural resources.They are the ones\nthat can grow again. Trees are a good example.\nIf cut down,they can regrow from seeds and\nsprouts.Animals are another example.\nBaby animals are born and grow up.\nThey replace older animals that die.\nNow, lets look at nonrenewable natural\nresources.They are found in the ground.\nThere are fixed amounts of these resources.\nThey are not living things, and they are\nsometimes hard to find.They don't\nregrow and they are not replaced\nor renewed.They include the fossil fuels we\nburn for energy (natural gas, coal, and oil).\nMinerals, used for making metals, are also\nnonrenewable natural resources.\nNonrenewable natural resources are things that\ntake longer than a persons lifespan\nto be replaced. In fact, they can take millions\nof years to form."),
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
