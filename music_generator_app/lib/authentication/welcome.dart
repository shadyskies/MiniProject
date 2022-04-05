import 'package:flutter/material.dart';

import 'login_button.dart';
import 'dottedline.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(children: <Widget>[
          Container(
              width: 600,
              height: 200,
              margin: const EdgeInsets.only(top: 150.0, bottom: 100.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                ),
              )),
          const ButtonWidget(buttonLabel: 'LOGIN'),
          const ButtonWidget(buttonLabel: 'SIGN UP'),
          Stack(children: <Widget>[
            Container(
              // padding: const EdgeInsets.only(left: 15.0),
              margin: const EdgeInsets.only(top: 25.0),
              child: CustomPaint(painter: DrawDottedhorizontalline()),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12.0),
              child: const Text('OR',
                  style: TextStyle(
                    // fontFamily: 'Raleway',
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ])
        ]));
  }
}
