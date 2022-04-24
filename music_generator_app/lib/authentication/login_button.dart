import 'package:flutter/material.dart';
import 'package:music_generator_app/profile/profileclass.dart';
import 'package:music_generator_app/profile/profilepage.dart';

class ButtonWidget extends StatelessWidget {
    final ProfileData profileData;
  final String buttonLabel;
  const ButtonWidget({
    Key? key,
    required this.buttonLabel,
    required this.profileData,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: OutlinedButton(
          child: Text(buttonLabel),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProfilePage(profileData: profileData)));
          },
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
