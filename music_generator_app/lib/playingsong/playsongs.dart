import 'package:flutter/material.dart';
import 'package:music_generator_app/playingsong/playaudio.dart';
import 'package:music_generator_app/profile/audioclass.dart';
import 'package:music_generator_app/profile/profileclass.dart';

class PlayAudioLists extends StatefulWidget {
  final ProfileData profileData;
  final AudioData song;
  // final int index;

  const PlayAudioLists({
    Key? key,
    required this.profileData,
    required this.song,
  }) : super(key: key);

  @override
  _PlayAudioLists createState() => _PlayAudioLists();
}

class _PlayAudioLists extends State<PlayAudioLists> {
  int selectedIndex = 0;

  late AudioData song;
  @override
  void initState() {
    for (var i = 0; i < widget.profileData.getAudioPosts.length; i++) {
      if (widget.profileData.getAudioPosts[i].compareTo(widget.song)) {
        song = widget.profileData.getAudioPosts[i];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            height: 800,
            child: Column(children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(
                          top: 40.0, left: 20.0, bottom: 0.0),
                      child: (widget.profileData.getImage.compareTo("") == 0)
                          ? const Icon(Icons.account_circle_outlined,
                              color: Colors.white, size: 55.0)
                          : CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage(widget.profileData.getImage),
                            )),
                  Container(
                    margin: const EdgeInsets.only(left: 10.0, top: 35.0),
                    child: Text(widget.profileData.getUserName,
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.pink.shade400,
                          fontWeight: FontWeight.normal,
                        )),
                  ),
                ]),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: Align(
                  alignment: Alignment(-0.8, 0.6),
                  child: Text(
                    'POSTS',
                    style: TextStyle(
                        fontSize: 22.0,
                        fontFamily: 'Audiowide',
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(child: PlayAudio(song: song)),
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
                                  margin: EdgeInsets.only(top: 55, left: 50),
                                  child: Icon(Icons.music_note_sharp,
                                      color: Colors.white, size: 40.0)),
                              trailing: //Container(

                                  // child:
                                  GestureDetector(
                                onTapDown: (TapDownDetails details) {
                                  _showPopupMenu(details.globalPosition);
                                },
                                child: Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ),
                              ),
                              // ),
                              //  subtitle: Text('This is subtitle'),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: selectedIndex == i
                                          ? Colors.blue
                                          : Colors.blue.shade800,
                                      width: selectedIndex == i ? 2 : 1),
                                  borderRadius: BorderRadius.circular(0.1)),
                              onTap: () {
                                setState(() {
                                  song = widget.profileData.getAudioPosts[i];
                                  selectedIndex = i;
                                });
                              }));
                    },
                  ),
                ),
              )
            ])));
  }

  _showPopupMenu(Offset offset) async {
    double left = offset.dx;
    double top = offset.dy;
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left / 2.0, top, left / 2.0, 0),
      items: [
        PopupMenuItem(
            value: 1,
            child: Row(children: <Widget>[
              const Icon(Icons.delete),
              const Text("Delete"),
            ])),
        PopupMenuItem(
          value: 2,
          child: Row(children: <Widget>[
            const Icon(Icons.share),
            const Text("Share"),
          ]),
        ),
        PopupMenuItem(
          value: 3,
          child: Row(children: <Widget>[
            const Icon(Icons.download),
            const Text("Download"),
          ]),
        ),
        PopupMenuItem(
          value: 4,
          child: Row(children: <Widget>[
            const Icon(Icons.info),
            const Text("Get Info"),
          ]),
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      if (value != null) print(value);
    });
  }
}
