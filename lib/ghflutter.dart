import 'dart:convert';

import 'package:flutter/material.dart';
import 'member.dart';
import 'strings.dart';
import 'package:http/http.dart' as http;

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
        final member= Member(memberJSON["login"], memberJSON["avatar_url"]);
        _members.add(member);
      }
    });
  }

  Widget _buildRow(int i) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        title: Text("${_members[i].login}",style: _biggerfont),
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          backgroundImage: NetworkImage(_members[i].avatarUrL),
        ),
      ),
    );
  }
}