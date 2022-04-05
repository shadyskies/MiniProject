import 'package:flutter/material.dart';

class InterestsWidget extends StatelessWidget {
  final String label;
  const InterestsWidget({
    Key? key,
    required this.label,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
                color: Colors.pink.shade400,
                child: Text(label,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    )))));
  }
}
