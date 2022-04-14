import 'package:music_generator_app/profile/audioclass.dart';

class ProfileData {
  String name;
  String username;
  String email;
  List<String> interests;
  String image;
  List<AudioData> postslist;
  List<AudioData> draftslist;

  ProfileData({
    required this.name,
    required this.email,
    required this.username,
    required this.interests,
    this.image = "",
    required this.postslist,
    required this.draftslist,
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

  List<AudioData> get getAudioPosts {
    return postslist;
  }

  List<AudioData> get getAudioDrafts {
    return draftslist;
  }
}
