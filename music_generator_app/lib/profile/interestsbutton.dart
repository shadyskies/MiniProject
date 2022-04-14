import 'package:flutter/material.dart';

class InterestsWidget extends StatelessWidget {
  final String label;
  const InterestsWidget({
    Key? key,
    required this.label,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        height: 25,
        child: Container(
            width: 80,
            color: Colors.pink.shade400,
            child: Center(
                child: Text(label,
                    style: const TextStyle(
                      fontSize: 17.0,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    )))));
  }
}
