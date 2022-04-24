// @dart=2.9
import 'package:flutter/material.dart';
import 'package:music_generator_app/profile/audioclass.dart';
import 'package:music_generator_app/profile/profileclass.dart';
import 'authentication/welcome.dart';

import 'musicgeneration/uploadfile.dart';
import 'playingsong/playaudio.dart';
import 'playingsong/playsongs.dart';
import 'playingsong/animations.dart';

import 'profile/profilepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Music Generator App',
        // home: PlayAudioLists(
        //     profileData: ProfileData(
        //         image: 'assets/images/shona.jpg',
        //         username: 'astha14',
        //         email: 'thakurastha2@gmail.com',
        //         postslist: [
        //           AudioData(name: 'In My Feels', file: 'audios/InMyFeels.mp3'),
        //           AudioData(name: 'Carol', file: 'audios/Carol.mp3')
        //         ],
        //         draftslist: [
        //           AudioData(name: 'Southern California'),
        //         ],
        //         name: 'ASTHA THAKUR',
        //         interests: ['Indie', 'Pop', 'Rock'])),
        // home: PlayAudio(
        //   file: 'audios/Carol.mp3',
        // ),
        //  PlayPauseButton(
        //   mp3name: 'country',
        // ),
        //Intro(),
        home: Intro(
            profileData: ProfileData(
                image: 'assets/images/shona.jpg',
                username: 'astha14',
                email: 'thakurastha2@gmail.com',
                postslist: [
                  AudioData(name: 'In My Feels', file: 'audios/InMyFeels.mp3'),
                  AudioData(name: 'Carol', file: 'audios/Carol.mp3')
                ],
                draftslist: [
                  AudioData(name: 'Southern'),
                ],
                name: 'ASTHA THAKUR',
                interests: ['Indie', 'Pop', 'Rock']))
        // home: const UploadFilePageWidget(),
        );
  }
}
