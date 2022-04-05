import 'package:music_generator_app/audioclass.dart';

class ProfileData {
  String name;
  String username;
  String email;
  List<String> interests;
  String image;
  // AudioData audio;

  ProfileData({
    required this.name,
    required this.email,
    required this.username,
    required this.interests,
    this.image = "",
    // required this.audio,
  });

  String get getName {
    return name;
  }

  String get getUserName {
    return username;
  }

  String get getEmail {
    return email;
  }

  List<String> get getInterests {
    return interests;
  }

  String get getImage {
    return image;
  }

  // AudioData get getAudio {
  //   return audio;
  // }
}
