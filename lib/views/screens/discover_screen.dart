import 'package:chalie_youthon/models/challenge.dart';
import 'package:chalie_youthon/views/screens/new_challenge_screen.dart';
import 'package:flutter/material.dart';

import '../../challenge_provider.dart';
import '../../unfinished.dart';
import '../theme.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  int select = 0;
  var test = testChallenges();
  List<Challenge> healthChallenge = [];
  List<Challenge> eduChallenge = [];
  List<Challenge> shortChallenge = [];

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _intro(context, 'Khám phá 🔥'),
            _buildCategory(),
            SizedBox(height: 10),
            Expanded(child: _buildList()),
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    final controller = ChallengeProvider.of(context);
    if (select == 0)
      return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: controller.challenges.length,
        itemBuilder: (context, index) => _card(controller.challenges[index]),
      );
    else if (select == 1)
      return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: controller.challenges
            .where((element) => element.tag == 'Học tập')
            .toList()
            .length,
        itemBuilder: (context, index) => _card(controller.challenges
            .where((element) => element.tag == 'Học tập')
            .toList()[index]),
      );
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: controller.challenges
          .where((element) => element.tag == 'Sức khỏe')
          .toList()
          .length,
      itemBuilder: (context, index) => _card(controller.challenges
          .where((element) => element.tag == 'Sức khỏe')
          .toList()[index]),
    );
  }

  Widget _buildCategory() {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
      height: 40,
      width: MediaQuery.of(context).size.width - 50,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                select = 0;
                setState(() {});
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  color: (select == 0) ? Colors.yellow : Colors.white,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Text(
                  'Tất cả',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                      color: Colors.black),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () {
                select = 1;
                setState(() {});
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  color: (select == 1) ? Colors.yellow : Colors.white,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Text(
                  'Học tập',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                      color: Colors.black),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () {
                select = 2;
                setState(() {});
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  color: (select == 2) ? Colors.yellow : Colors.white,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Text(
                  'Sức khỏe',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                      color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _intro(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 20, 25, 20),
      child: Text(
        '$text',
        style: TextStyle(
            fontSize: 32, fontWeight: FontWeight.w700, fontFamily: 'Inter'),
      ),
    );
  }

  Widget _card(Challenge chal) {
    return GestureDetector(
      onTap: () => {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => NewChallenge(challenge: chal)))
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10, left: 25, right: 25),
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
                width: MediaQuery.of(context).size.width * 0.55,
                child: Text(
                  chal.name,
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                      color: Colors.white),
                )),
            Text(
              '${chal.finisher}\nđã tham gia',
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
