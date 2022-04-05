import 'package:flutter/material.dart';
import 'package:music_generator_app/profile/profileclass.dart';
import 'authentication/welcome.dart';
import 'profile/profilepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Generator App',
      home: Intro(),
      // home: ProfilePage(
      //     //profileData: ProfileData(image: 'assets/images/shona.jpg')),
      //     profileData: ProfileData(
      //         username: 'astha14',
      //         email: 'thakurastha2@gmail.com',
      //         name: 'ASTHA THAKUR',
      //         interests: ['Indie', 'Pop', 'Rock'])),
    );
  }
}
