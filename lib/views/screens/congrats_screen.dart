import 'dart:math';

import 'package:chalie_youthon/models/challenge.dart';
import 'package:chalie_youthon/unfinished.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:ionicons/ionicons.dart';

import '../theme.dart';

class CongratsDay extends StatefulWidget {
  final Challenge challenge;

  const CongratsDay({Key? key, required this.challenge}) : super(key: key);

  @override
  _CongratsDayState createState() => _CongratsDayState();
}

class _CongratsDayState extends State<CongratsDay> {
  Challenge get challenge => widget.challenge;
  late ConfettiController _confetti;

  @override
  void initState() {
    _confetti = ConfettiController(duration: Duration(seconds: 5));
    _confetti.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: ConfettiWidget(
                confettiController: _confetti,
                blastDirection: pi / 2,
              ),
            ),
            _buildMiddle(),
            _buildBottom(),
          ],
        ),
      ),
    );
  }

  Column _buildMiddle() {
    return Column(
      children: [
        Text(
          'Chúc mừng!!!',
          style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              color: Colors.black),
        ),
        SizedBox(height: 25),
        Container(
          child: Icon(
            Ionicons.medal_outline,
            color: Colors.black,
            size: 200,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Hoàn thành ngày ${challenge.completeCount}',
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
              color: Colors.black),
        ),
        SizedBox(height: 5),
        Text(
          '${challenge.name}',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildBottom() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(bottom: 10, left: 25),
                padding: EdgeInsets.all(15),
                height: 70,
                width: (MediaQuery.of(context).size.width-60)/2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Text(
                  'Lưu ảnh',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                      color: Colors.white),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(bottom: 10, right: 25),
                padding: EdgeInsets.all(15),
                height: 70,
                width: (MediaQuery.of(context).size.width-60)/2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Text(
                  'Chia sẻ',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(bottom: 25, left: 25, right: 25),
            padding: EdgeInsets.all(15),
            height: 70,
            width: MediaQuery.of(context).size.width-50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Text(
              'Trở về',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class CongratsChallenge extends StatefulWidget {
  final Challenge challenge;

  const CongratsChallenge({Key? key, required this.challenge}) : super(key: key);

  @override
  _CongratsChallengeState createState() => _CongratsChallengeState();
}

class _CongratsChallengeState extends State<CongratsChallenge> {
  Challenge get challenge => widget.challenge;
  late ConfettiController _confetti;

  @override
  void initState() {
    _confetti = ConfettiController(duration: Duration(seconds: 5));
    _confetti.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: ConfettiWidget(
                confettiController: _confetti,
                blastDirection: pi / 2,
              ),
            ),
            _buildMiddle(),
            _buildBottom(),
          ],
        ),
      ),
    );
  }

  Column _buildMiddle() {
    return Column(
      children: [
        Text(
          'Chúc mừng!!!',
          style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              color: Colors.black),
        ),
        SizedBox(height: 25),
        Container(
          child: Icon(
            Ionicons.trophy_outline,
            color: Colors.black,
            size: 200,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Hoàn thành',
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
              color: Colors.black),
        ),
        SizedBox(height: 5),
        Text(
          '${challenge.name}',
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildBottom() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(bottom: 10, left: 25),
                padding: EdgeInsets.all(15),
                height: 70,
                width: (MediaQuery.of(context).size.width-60)/2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Text(
                  'Lưu ảnh',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                      color: Colors.white),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(bottom: 10, right: 25),
                padding: EdgeInsets.all(15),
                height: 70,
                width: (MediaQuery.of(context).size.width-60)/2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Text(
                  'Chia sẻ',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(bottom: 25, left: 25, right: 25),
            padding: EdgeInsets.all(15),
            height: 70,
            width: MediaQuery.of(context).size.width-50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Text(
              'Trở về',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
