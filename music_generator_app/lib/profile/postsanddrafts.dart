import 'package:flutter/material.dart';
import 'package:music_generator_app/profile/profileclass.dart';
import 'package:music_generator_app/profile/songscontainer.dart';

import 'audioclass.dart';

class PostsandDrafts extends StatefulWidget {
  final ProfileData profileData;
  const PostsandDrafts({
    Key? key,
    required this.profileData,
  }) : super(key: key);

  @override
  _PostsandDraftsState createState() => _PostsandDraftsState();
}

class _PostsandDraftsState extends State<PostsandDrafts> {
  bool isPrev = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 75,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 5.0,
                          color: isPrev ? Colors.grey : Colors.white),
                    ),
                  ),
                  child: TextButton(
                    child: Text(
                      'Posts',
                      style: TextStyle(
                        fontSize: 27,
                        color: isPrev ? Colors.grey : Colors.white,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        isPrev = false;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                  height: 75,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 5.0,
                            color: isPrev ? Colors.white : Colors.grey),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isPrev = true;
                        });
                      },
                      child: Text(
                        'Drafts',
                        style: TextStyle(
                          fontSize: 27,
                          color: isPrev ? Colors.white : Colors.grey,
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
        // Expanded(
        //     child:
        SizedBox(
            height: 100,
            child: isPrev
                ? Container(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                        height: 100.0,
                        child: GridView.count(
                            crossAxisCount: 2,
                            padding: const EdgeInsets.only(
                                left: 15, right: 190, bottom: 90),
                            crossAxisSpacing: 1.0,
                            mainAxisSpacing: 5.0,
                            children: List.generate(
                                widget.profileData.getAudioPosts.length,
                                (index) {
                              return SongIconWidget(
                                  song:
                                      widget.profileData.getAudioPosts[index]);
                            }))))
                : Container(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                        height: 100.0,
                        child: GridView.count(
                            crossAxisCount: 2,
                            padding: const EdgeInsets.only(
                                left: 15, right: 190, bottom: 90),
                            crossAxisSpacing: 1.0,
                            mainAxisSpacing: 5.0,
                            children: List.generate(
                                widget.profileData.getAudioDrafts.length,
                                (index) {
                              return SongIconWidget(
                                  song:
                                      widget.profileData.getAudioDrafts[index]);
                            })))))
        // )
      ]),
    );
  }
}
