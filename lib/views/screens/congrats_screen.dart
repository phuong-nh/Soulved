import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'package:chalie_youthon/challenge_provider.dart';
import 'package:chalie_youthon/controllers/challenge_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
import 'package:chalie_youthon/models/challenge.dart';
import 'package:chalie_youthon/unfinished.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:convert';

import '../theme.dart';
import 'home_screen.dart';

class CongratsDay extends StatefulWidget {
  final Challenge challenge;

  const CongratsDay({Key? key, required this.challenge}) : super(key: key);

  @override
  _CongratsDayState createState() => _CongratsDayState();
}

class _CongratsDayState extends State<CongratsDay> {
  late final controller;
  String uploadedFile = '';
  Challenge get challenge => widget.challenge;
  late ConfettiController _confetti;

  @override
  void didChangeDependencies() {
    controller = ChallengeProvider.of(context);
  }

  File? _imageFile;

  Future uploadImageToFirebase(BuildContext context) async {
    String fileName = Path.basename(_imageFile!.path);
    var firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/$fileName');
    var uploadTask = firebaseStorageRef.putFile(_imageFile!);
    var taskSnapshot = await uploadTask;
    taskSnapshot.ref.getDownloadURL().then(
          (value) => print("Done: $value"),
        );
  }

  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _imageFile = File(pickedFile!.path);
    });
  }

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
        GestureDetector(
          onTap: () async {
            print("hei");
            // await pickImage();
            // await uploadImageToFirebase(context);
            // final controller = ChallengeProvider.of(context);
            // controller.challenges
            //     .firstWhere((element) => element.id == challenge.id)
            //     .days[challenge.completeCount - 1]
            //     .userimage = uploadedFile;
            // print('finished');
            // String user = "Frontliners";
            // controller.saveAll();
            Share.share("Tôi đã hoàn thành thử thách");
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 10, left: 0),
            padding: EdgeInsets.all(15),
            height: 70,
            width: MediaQuery.of(context).size.width - 50,
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
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => HomeScreen()));
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 25, left: 25, right: 25),
            padding: EdgeInsets.all(15),
            height: 70,
            width: MediaQuery.of(context).size.width - 50,
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

  const CongratsChallenge({Key? key, required this.challenge})
      : super(key: key);

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
                width: (MediaQuery.of(context).size.width - 60) / 2,
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
                width: (MediaQuery.of(context).size.width - 60) / 2,
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
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => HomeScreen()));
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 25, left: 25, right: 25),
            padding: EdgeInsets.all(15),
            height: 70,
            width: MediaQuery.of(context).size.width - 50,
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
