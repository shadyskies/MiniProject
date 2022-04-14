import 'package:flutter/material.dart';
import 'package:music_generator_app/playingsong/playaudio.dart';
import 'package:music_generator_app/profile/profileclass.dart';



class PlayAudioLists extends StatefulWidget {
  final ProfileData profileData;

  const PlayAudioLists({
    Key? key,
    required this.profileData,
  }) : super(key: key);

  @override
  _PlayAudioLists createState() => _PlayAudioLists();
}

class _PlayAudioLists extends State<PlayAudioLists> {
  int selectedIndex = 0;
  late String file;
  @override
  void initState() {
    file = widget.profileData.getAudioPosts[0].getFile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            height: 800,
            child: Column(children: <Widget>[
              const SizedBox(height: 140),
              Expanded(child: PlayAudio(file: file)),
              SizedBox(
                height: 220,
                child: Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.profileData.getAudioPosts.length,
                    itemBuilder: (context, i) {
                      return Container(
                          margin: EdgeInsets.only(
                            left: 20,
                            top: selectedIndex == i ? 30 : 37,
                            bottom: selectedIndex == i ? 30 : 35,
                          ),
                          width: 190,
                          child: ListTile(
                              leading: Container(
                                  padding: EdgeInsets.only(top: 40, left: 40),
                                  child: Icon(Icons.music_note_sharp,
                                      color: Colors.white, size: 80.0)),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: selectedIndex == i
                                          ? Colors.blue
                                          : Colors.blue.shade800,
                                      width: selectedIndex == i ? 2 : 1),
                                  borderRadius: BorderRadius.circular(0.1)),
                              onTap: () {
                                setState(() {
                                  file = widget
                                      .profileData.getAudioPosts[i].getFile;
                                  selectedIndex = i;
                                });
                              }));
                    },
                  ),
                ),
              )
            ])));
  }
}
