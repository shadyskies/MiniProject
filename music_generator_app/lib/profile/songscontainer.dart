import 'package:flutter/material.dart';

import 'audioclass.dart';

class SongIconWidget extends StatelessWidget {
  final AudioData song;

  const SongIconWidget({
    Key? key,
    required this.song,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.blue.shade900, width: 2),
          ),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => route),
            // );},
          },
          child: Container(
              color: Colors.black,
              child: const Icon(
                Icons.audiotrack,
                color: Colors.white,
                size: 20.0,
              ))),
      Text(song.getName,
          style: const TextStyle(
            fontSize: 15.0,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          )),
    ]);
  }
}
