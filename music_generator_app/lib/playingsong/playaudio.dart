// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:music_generator_app/profile/audioclass.dart';
import 'package:music_generator_app/profile/profileclass.dart';

import 'animations.dart';

class PlayAudio extends StatefulWidget {
  final AudioData song;
  PlayAudio({
    required this.song,
    Key? key,
  }) : super(key: key);

  @override
  _PlayAudio createState() => _PlayAudio();
}

class _PlayAudio extends State<PlayAudio> {
  bool playing = false;
  IconData playBtn = Icons.play_circle_outline;

  late AudioPlayer _player;
  late AudioCache cache;

  Duration position = const Duration();
  Duration musicLength = const Duration();

  Widget slider() {
    return SizedBox(
      width: 170.0,
      child: Slider.adaptive(
          activeColor: Colors.white,
          inactiveColor: Colors.grey[350],
          value: position.inSeconds.toDouble(),
          max: musicLength.inSeconds.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);

    // ignore: deprecated_member_use
    _player.durationHandler = (d) {
      setState(() {
        musicLength = d;
      });
    };

    // ignore: deprecated_member_use
    _player.positionHandler = (p) {
      setState(() {
        position = p;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
            height: 400,
            child: Column(children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  height: 190,
                  width: 200,
                  child: Play(isPlaying: playing),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Text(
                  widget.song.getName,
                  style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Audiowide',
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ),
              Center(
                  child: Container(
                height: 80,
                width: 350,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                child: Row(children: <Widget>[
                  IconButton(
                    onPressed: () {
                      if (!playing) {
                        cache.play(widget.song.getFile);
                        //cache.play('audios/InMyFeels.mp3');
                        setState(() {
                          playBtn = Icons.pause;
                          playing = true;
                        });
                      } else {
                        _player.pause();
                        setState(() {
                          playBtn = Icons.play_circle_outline;
                          playing = false;
                        });
                      }
                    },
                    icon: Icon(playBtn, color: Colors.white, size: 35.0),
                  ),
                  Text(
                    "${position.inMinutes}:${position.inSeconds.remainder(60)}/${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  slider(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.volume_up,
                        color: Colors.white, size: 30.0),
                  )
                ]),
              ))
            ])));
  }
}
