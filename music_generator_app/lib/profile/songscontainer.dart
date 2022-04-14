import 'package:flutter/material.dart';
import 'package:music_generator_app/playingsong/playsongs.dart';

import 'audioclass.dart';
import 'profileclass.dart';

class SongIconWidget extends StatelessWidget {
  final ProfileData profileData;
  // final int index;
  final AudioData song;

  const SongIconWidget({
    Key? key,
    required this.song,
    // required this.index,
    required this.profileData,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        height: 100,
        width: 100,
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.blue.shade900, width: 2),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PlayAudioLists(
                          profileData: profileData, song: song)));
            },
            child: Container(
                color: Colors.black,
                child: const Icon(
                  Icons.audiotrack,
                  color: Colors.white,
                  size: 30.0,
                ))),
      ),
      const SizedBox(height: 10),
      Text(song.getName,
          style: const TextStyle(
            fontSize: 15.0,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          )),
    ]);
  }
}
