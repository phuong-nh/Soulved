import 'package:chalie_youthon/views/screens/home_screen.dart';
import 'package:chalie_youthon/unfinished.dart';
import 'package:chalie_youthon/views/theme.dart';
import 'package:flutter/material.dart';
import 'challenge_provider.dart';

void main() => runApp(ChallengeProvider(child: Chalie()));

class Chalie extends StatelessWidget {
  const Chalie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
