import 'dart:convert';

import 'package:chalie_youthon/challenge_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:html_unescape/html_unescape.dart';


import '../../unfinished.dart';

class DebugScreen extends StatefulWidget {
  const DebugScreen({Key? key}) : super(key: key);

  @override
  _DebugScreenState createState() => _DebugScreenState();
}

class _DebugScreenState extends State<DebugScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _killData(),
          _firebaseStoreage(),
        ],
      ),
    );
  }

  Widget _killData() {
    return GestureDetector(
      onTap: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('challenges');
        print('Killed all data');
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
        child: Text(
          "Kill all data",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _firebaseStoreage() {
    return GestureDetector(
      onTap: () async {
        print("Test Firebase Storage");
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
        child: Text(
          "Test Firebase Storage",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

Future<void> killData() async {}
