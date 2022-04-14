class AudioData {
  String name;
  // String duration;
  String file;
 

  AudioData({
    required this.name,
    // required this.duration,
    required this.file,
   
  });

  String get getName {
    return name;
  }

  // String get getDuration {
  //   return duration;
  // }

  String get getFile {
    return file;
  }

}
