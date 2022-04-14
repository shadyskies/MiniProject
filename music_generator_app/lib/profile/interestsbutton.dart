import 'package:flutter/material.dart';

class InterestsWidget extends StatelessWidget {
  final String label;
  const InterestsWidget({
    Key? key,
    required this.label,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 80,
            height: 25,
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
