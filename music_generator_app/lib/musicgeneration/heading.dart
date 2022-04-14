import 'package:flutter/material.dart';

class HeadingsWidget extends StatelessWidget {
  final String heading;
  const HeadingsWidget({
    Key? key,
    required this.heading,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Center(
          child: Container(
        margin: const EdgeInsets.only(top: 70),
        width: 270,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(width: 7, color: Colors.pink.shade500),
        ),
        child: Center(
            child: Text(
          heading,
          style: const TextStyle(
              fontSize: 17.0,
              fontFamily: 'Audiowide',
              fontWeight: FontWeight.w900,
              color: Colors.white),
        )),
      )),
      Center(
          child: Container(
        width: 270,
        decoration: const BoxDecoration(
            border: Border(
          bottom: BorderSide(width: 1.5, color: Colors.blue),
        )),
      ))
    ]);
  }
}
