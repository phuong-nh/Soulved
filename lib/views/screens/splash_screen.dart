import 'dart:async';
import 'package:chalie_youthon/controllers/challenge_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../challenge_provider.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class MyNavigator {
  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context, "/home");
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
    super.initState();
    Timer(Duration(seconds: 2), () => MyNavigator.goToHome(context));
  }

  void didChangeDependencies() {
    final controller = ChallengeProvider.of(context);
    controller.startup();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
        width: MediaQuery.of(context).size.width - 50,
        margin: EdgeInsets.fromLTRB(25, 130, 25, 130),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Icon(
                  Ionicons.happy_outline,
                  size: 200,
                ),
                SizedBox(height: 20),
                Text(
                  'Soulved',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter',
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'by Frontliners',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
            CircularProgressIndicator(
              color: Colors.black,
              strokeWidth: 10,
            ),
          ],
        ),
      ),
    );
  }
}
