import 'package:flutter/material.dart';
import 'package:music_generator_app/profile/profileclass.dart';
import 'authentication/welcome.dart';
import 'playingsong/playsongs.dart';
import 'profile/audioclass.dart';
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
        home: PlayAudioLists(
            profileData: ProfileData(
                username: 'astha14',
                email: 'thakurastha2@gmail.com',
                postslist: [
                  AudioData(name: 'In My Feels', file: 'audios/InMyFeels.mp3'),
                  AudioData(name: 'Carol', file: 'audios/Carol.mp3')
                ],
                draftslist: [
                  AudioData(
                      name: 'Southern California', file: 'audios/Carol.mp3'),
                ],
                name: 'ASTHA THAKUR',
                interests: ['Indie', 'Pop', 'Rock'])));
    // home: PlayAudio(
    //   file: 'audios/Carol.mp3',
    // ),
    //  PlayPauseButton(
    //   mp3name: 'country',
    // ),
    //Intro(),

    // home: ProfilePage(
    //     profileData: ProfileData(image: 'assets/images/shona.jpg')),
    // profileData: ProfileData(
    //     username: 'astha14',
    //     email: 'thakurastha2@gmail.com',
    //     postslist: [
    //       AudioData(name: 'In My Feels'),
    //       AudioData(name: 'Carol')
    //     ],
    //     draftslist: [
    //       AudioData(name: 'Southern California'),
    //     ],
    //     name: 'ASTHA THAKUR',
    //     interests: ['Indie', 'Pop', 'Rock'])),
  }
}
