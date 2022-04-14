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
        Container(
          padding: EdgeInsets.only(bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 75,
                width: 170,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 5.0,
                          color: isPrev ? Colors.white : Colors.grey),
                    ),
                  ),
                  child: TextButton(
                    child: Text(
                      'POSTS',
                      style: TextStyle(
                        fontFamily: 'Audiowide',
                        fontSize: 25,
                        color: isPrev ? Colors.white : Colors.grey,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        isPrev = true;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                  height: 75,
                  width: 170,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 5.0,
                            color: isPrev ? Colors.grey : Colors.white),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isPrev = false;
                        });
                      },
                      child: Text(
                        'DRAFTS',
                        style: TextStyle(
                          fontFamily: 'Audiowide',
                          fontSize: 25,
                          color: isPrev ? Colors.grey : Colors.white,
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),

        isPrev
            ? SizedBox(
                height: 200,
                child: GridView.count(
                    crossAxisCount: 3,
                    padding:
                        const EdgeInsets.only(left: 15, right: 10, bottom: 90),
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 5.0,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    //physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(
                        widget.profileData.getAudioPosts.length, (index) {
                      return SongIconWidget(
                          profileData: widget.profileData,
                          song: widget.profileData.getAudioPosts[index]);
                    })))
            : SizedBox(
                height: 200,
                child: GridView.count(
                    crossAxisCount: 3,
                    padding:
                        const EdgeInsets.only(left: 15, right: 10, bottom: 90),
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 5.0,
                    //shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: List.generate(
                        widget.profileData.getAudioDrafts.length, (index) {
                      return SongIconWidget(
                          profileData: widget.profileData,
                          song: widget.profileData.getAudioDrafts[index]);
                    })))
        // )
      ]),
    );
  }
}
