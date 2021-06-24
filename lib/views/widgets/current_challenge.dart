import 'package:chalie_youthon/models/challenge.dart';
import 'package:chalie_youthon/unfinished.dart';
import 'package:chalie_youthon/views/screens/current_task_screen.dart';
import 'package:chalie_youthon/views/theme.dart';
import 'package:flutter/material.dart';

class CurrentChallenge extends StatefulWidget {
  const CurrentChallenge({Key? key}) : super(key: key);

  @override
  _CurrentChallengeState createState() => _CurrentChallengeState();
}

class _CurrentChallengeState extends State<CurrentChallenge> {
  var currentChallenges = testChallenges();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: Column(children: [
        _card(currentChallenges[0]),
        _card(currentChallenges[0]),
        _card(currentChallenges[0]),
        _card(currentChallenges[0]),
        _card(currentChallenges[0]),
        _card(currentChallenges[0]),
        _card(currentChallenges[0]),
      ]),
    );
  }

  Widget _card(Challenge chal) {
    return GestureDetector(
      onTap: () => {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => CurrentTask(challenge: chal)))
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(15),
        height: 150,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(borderRadius),
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.dstATop),
              image: NetworkImage(imageLink(chal.image)),
              fit: BoxFit.cover),
        ),
        child: Row(
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
                )),
            Text(
              '${chal.dayLeft} ngày\ncòn lại',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Inter',
                color: Colors.white,
              ),
              textAlign: TextAlign.right,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
        ),
      ),
    );
  }
}
