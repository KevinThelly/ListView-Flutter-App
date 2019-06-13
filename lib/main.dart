import 'package:flutter/material.dart';
import 'ghflutter.dart';
import 'strings.dart';

void main() => runApp(new GHFlutterApp());

class GHFlutterApp extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      home: new GHFlutter(),
    );
  }
}



