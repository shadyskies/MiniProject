import 'package:flutter/material.dart';
import 'package:music_generator_app/profile/interestsbutton.dart';
import 'package:music_generator_app/profile/songscontainer.dart';
import 'postsanddrafts.dart';
import 'profileclass.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  final ProfileData profileData;
  const ProfilePage({
    Key? key,
    required this.profileData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 50.0, left: 10.0, bottom: 0.0),
            child: Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 10.0, bottom: 0.0),
                  child: (profileData.getImage.compareTo("") == 0)
                      ? Stack(children: <Widget>[
                          const Icon(Icons.account_circle_outlined,
                              color: Colors.white, size: 100.0),
                          Container(

                              // padding: const EdgeInsets.only(left: 15.0),
                              margin:
                                  const EdgeInsets.only(top: 60.0, left: 55.0),
                              child: const Icon(Icons.add_circle_outlined,
                                  color: Colors.grey, size: 40.0)),
                        ])
                      : Stack(children: <Widget>[
                          CircleAvatar(
                            radius: 45,
                            backgroundImage: AssetImage(profileData.getImage),
                          ),
                          Container(

                              // padding: const EdgeInsets.only(left: 15.0),
                              margin:
                                  const EdgeInsets.only(top: 53.0, left: 50.0),
                              child: const Icon(Icons.edit,
                                  color: Colors.white, size: 45.0))
                        ]),
                ),
                Column(children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 5.0),
                    // margin:
                    //     const EdgeInsets.only(top: 53.0, left: 50.0),
                    child: Text(profileData.getUserName,
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.pink.shade400,
                          fontWeight: FontWeight.normal,
                        )),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 30.0),
                      margin: const EdgeInsets.only(top: 5.0),
                      child: Text(profileData.getName,
                          style: const TextStyle(
                            fontFamily: 'Audiowide',
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ))),
                  Container(
                    padding: const EdgeInsets.only(top: 5.0, left: 5.0),
                    child: Row(children: <Widget>[
                      Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: const Text('Contact me',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ))),
                      GestureDetector(
                        onTap: () {
                          sendEmail(profileData.getEmail);
                        }, // Image tapped
                        child: Image.asset(
                          'assets/images/email.png',
                          fit: BoxFit.fill, // Fixes border issues
                          width: 30.0,
                          height: 20.0,
                        ),
                      )
                    ]),
                  )
                ]),
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.only(right: 280.0, top: 15, bottom: 5),
              child: const Text('Interests',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ))),
          GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.only(
              left: 25,
              right: 190,
            ),
            crossAxisSpacing: 7.0,
            shrinkWrap: true,
            physics: new NeverScrollableScrollPhysics(),
            childAspectRatio: (1.3 / .4),
            mainAxisSpacing: 0.5,
            children: List.generate(
              profileData.getInterests.length,
              (index) {
                return InterestsWidget(label: profileData.getInterests[index]);
              },
            ),
          ),
          PostsandDrafts(profileData: profileData),
          Container(
            margin: EdgeInsets.only(top: 30, right: 40),
            child: IconButton(
              icon: Icon(Icons.add_circle_outline_rounded,
                  color: Colors.pink.shade400, size: 70),
              onPressed: () {},
            ),
          )
        ]));
  }

  Future sendEmail(String _email) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'thakurastha2@gmail.com',
    );

    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch';
    }
  }
}
