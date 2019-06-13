import 'package:flutter/material.dart';
import 'strings.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(new GHFlutterApp());

class GHFlutterApp extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      home: new GHFlutter(),
    );
  }
}

class GHFlutter extends StatefulWidget {
  createState() => new GHFlutterState();
}

class GHFlutterState extends State<GHFlutter> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),
      ),
      body: ListView.builder(
          itemCount: _members.length * 2,
          itemBuilder: (BuildContext context, int position) {
            if (position.isOdd) return Divider();
            final index = position ~/ 2;
            return _buildRow(index);
          }),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  var _members = <Member>[];
  final _biggerfont = const TextStyle(fontSize: 18.0);

  _loadData() async {
    String dataURL = "https://api.github.com/orgs/raywenderlich/members";
    http.Response response = await http.get(dataURL);
    setState(() {
      final membersJSON = json.decode(response.body);

      for( var memberJSON in membersJSON){
        final member=new Member(memberJSON["login"]);
        _members.add(member);
      }
    });
  }

  Widget _buildRow(int i) {
    return ListTile(
      title: new Text("${_members[i].login}", style: _biggerfont,),

    );
  }
}

class Member {
  final String login;
  final String avatarUrL;
  

  Member(this.login,this.avatarUrL) {
    if (login == null) {
      throw new ArgumentError("login of Member cannot be null. "
          "Received: '$login'");
    }
  }
}