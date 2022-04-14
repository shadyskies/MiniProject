import 'package:flutter/material.dart';
import 'package:music_generator_app/profile/audioclass.dart';

class SongIcon extends StatelessWidget {
  final AudioData song;
  final bool isSelected;
  final Function onpressed;

  const SongIcon(
      {Key? key,
      required this.song,
      required this.isSelected,
      required this.onpressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
                color: isSelected ? Colors.blue : Colors.blue.shade900,
                width: 2),
          ),
          onPressed: onpressed(),
          child: Container(
              color: Colors.black,
              child: const Icon(
                Icons.audiotrack,
                color: Colors.white,
                size: 20.0,
              ))),
      if (isSelected)
        Text(song.getName,
            style: const TextStyle(
              fontSize: 15.0,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            )),
    ]);
  }
}
