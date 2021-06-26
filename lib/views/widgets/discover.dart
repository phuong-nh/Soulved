import 'dart:convert';

import 'package:chalie_youthon/models/challenge.dart';
import 'package:chalie_youthon/models/column_builder.dart';
import 'package:chalie_youthon/views/screens/new_challenge_screen.dart';
import 'package:chalie_youthon/views/widgets/current_challenge.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../challenge_provider.dart';
import '../../unfinished.dart';
import '../theme.dart';

class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  var recommendedChallenges = <Widget>[];

  @override
  void didChangeDependencies() {
    final controller = ChallengeProvider.of(context);
    for (Challenge challenge in controller.challenges) recommendedChallenges.add(_card(challenge));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: 15),
          ...recommendedChallenges,
          SizedBox(width: 25),
        ],
      ),
    );
  }

  Widget _card(Challenge chal) {
    return GestureDetector(
      onTap: () async {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => NewChallenge(challenge: chal)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10, left: 10),
        padding: EdgeInsets.all(15),
        height: 300,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(borderRadius),
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.dstATop),
              image: NetworkImage(imageLink(chal.image)),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                chal.name,
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '${chal.finisher} đã tham gia',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Inter',
                color: Colors.white,
              ),
              textAlign: TextAlign.left,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
