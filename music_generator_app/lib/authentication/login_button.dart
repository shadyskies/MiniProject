import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonLabel;
  const ButtonWidget({
    Key? key,
    required this.buttonLabel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: OutlinedButton(
          child: Text(buttonLabel),
          onPressed: () {},
          style: OutlinedButton.styleFrom(
              primary: Colors.white,
              shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              side: BorderSide(color: Colors.pink.shade100, width: 1),
              textStyle: const TextStyle(
                fontFamily: 'Audiowide',
                fontSize: 30.0,
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              )),
        ));
  }
}
