import 'package:flutter/material.dart';
import 'ghflutter.dart';
import 'strings.dart';
import 'package:flutter/material.dart';

void main() => runApp(new GHFlutterApp());

class GHFlutterApp extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(primaryColor: Colors.green.shade800),
      home: new GHFlutter(),
    );
  }
}



