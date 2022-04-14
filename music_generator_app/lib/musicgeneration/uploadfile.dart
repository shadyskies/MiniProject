import 'package:flutter/material.dart';

import 'heading.dart';

class UploadFilePageWidget extends StatelessWidget {
  const UploadFilePageWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
            children: const <Widget>[HeadingsWidget(heading: 'GENERATE MUSIC')]));
  }
}
