import 'package:flutter/material.dart';
import 'package:music_generator_app/profile/interestsbutton.dart';
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
          Row(
            children: <Widget>[
              Container(
                margin:
                    const EdgeInsets.only(top: 65.0, left: 20.0, bottom: 0.0),
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(60.0),
                          child: Image.asset(
                            profileData.getImage,
                            height: 100.0,
                            width: 100.0,
                          ),
                        ),
                        Container(

                            // padding: const EdgeInsets.only(left: 15.0),
                            margin:
                                const EdgeInsets.only(top: 55.0, left: 65.0),
                            child: const Icon(Icons.edit,
                                color: Colors.white, size: 40.0))
                      ]),
              ),
              Column(children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 0.0, top: 20.0),
                  child: Text(profileData.getUserName,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.pink.shade400,
                        fontWeight: FontWeight.normal,
                      )),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 10.0, top: 10.0),
                    child: Text(profileData.getName,
                        style: const TextStyle(
                          fontFamily: 'Audiowide',
                          fontSize: 15.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ))),
                Row(children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(left: 10.0, top: 10.0),
                      child: const Text('Contact me',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ))),
                  IconButton(
                    // onPressed: () => sendEmail(profileData.getEmail),
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                  )
                ]),
              ]),
            ],
          ),
          Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: const Text('Interests',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ))),
          Container(
            padding: EdgeInsets.all(12.0),
            child: Expanded(
                child: SizedBox(
                    height: 400.0,
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1.0,
                      mainAxisSpacing: 10.0,
                      children: List.generate(
                        profileData.getInterests.length,
                        (index) {
                          return InterestsWidget(
                              label: profileData.getInterests[index]);
                        },
                      ),
                    ))),
          ),
          

        ]));
  }

  Future sendEmail(String _email) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'email@example.com',
    );

    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch';
    }
  }
}
