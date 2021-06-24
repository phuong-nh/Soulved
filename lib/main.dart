import 'package:chalie_youthon/views/screens/home_screen.dart';
import 'package:chalie_youthon/unfinished.dart';
import 'package:chalie_youthon/views/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(Chalie());

class Chalie extends StatelessWidget {
  const Chalie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
