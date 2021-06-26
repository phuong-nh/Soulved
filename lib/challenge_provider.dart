import 'package:flutter/material.dart';
import 'controllers/challenge_controller.dart';
import 'models/challenge.dart';

class ChallengeProvider extends InheritedWidget {
  final _controller = ChallengeController();
  final _challenges = <Challenge>[];
  
  ChallengeProvider({Key? key, required Widget child})
      : super(key: key, child: child);
  
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static ChallengeController of(BuildContext context) {
    ChallengeProvider? provider = context.dependOnInheritedWidgetOfExactType<ChallengeProvider>();
    return provider!._controller;
  }
}