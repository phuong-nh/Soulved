import 'package:chalie_youthon/models/challenge.dart';
import 'package:chalie_youthon/models/column_builder.dart';
import 'package:chalie_youthon/models/task.dart';
import 'package:chalie_youthon/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../challenge_provider.dart';
import '../../unfinished.dart';
import '../theme.dart';

class NewChallenge extends StatefulWidget {
  final Challenge challenge;

  const NewChallenge({Key? key, required this.challenge}) : super(key: key);

  @override
  _NewChallengeState createState() => _NewChallengeState();
}

class _NewChallengeState extends State<NewChallenge> {
  Challenge get challenge => widget.challenge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          _buildScreen(context),
          _buildSelect(context),
        ],
      ),
    );
  }

  Widget _buildScreen(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        _buildTopImage(),
        _buildInfo(),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            'Ngày',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 20),
        _buildList(),
        SizedBox(height: 120),
      ],
    );
  }

  Widget _buildInfo() {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '#${challenge.tag}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              fontFamily: 'Inter',
              color: Colors.yellow.shade800,
            ),
          ),
          Text(
            '${challenge.name}',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Thời lượng: ${challenge.length} ngày',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Đánh giá: ${challenge.rating}/10',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
              color: Colors.black,
            ),
          ),
          Text(
            'Tạo bởi: ${challenge.creator}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          Text(
            '${challenge.description}',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Inter',
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  String _state() {
    if (challenge.doing) return "Bạn đang tham gia";
    if (challenge.finished) return "Bạn đã hoàn thành";
    return "Tham gia";
  }

  GestureDetector _buildSelect(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final controller = ChallengeProvider.of(context);
        if (!controller.challenges
            .where((element) => element.id == challenge.id)
            .first
            .finished)
          controller.challenges
              .where((element) => element.id == challenge.id)
              .first
              .doing = true;
        controller.saveAll();
        setState(() {});
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
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Text(
          _state(),
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
              color: Colors.black),
        ),
      ),
    );
  }

  Container _buildTopImage() {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
            image: NetworkImage(imageLink(challenge.image)), fit: BoxFit.cover),
      ),
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Container(
              padding: EdgeInsets.only(left: 15, top: 5),
              child: IconButton(
                icon: Icon(
                  Ionicons.arrow_back_outline,
                  size: 35,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => HomeScreen()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    return ColumnBuilder(
      itemCount: challenge.days.length,
      itemBuilder: (context, index) =>
          _buildDayTile(challenge.days[index], index + 1),
    );
  }

  Widget _buildDayTile(Day day, int count) {
    return ListTile(
      leading: Container(
        margin: const EdgeInsets.only(left: 25),
        child: Text(
          '$count',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            fontFamily: 'Inter',
            color: Colors.black,
          ),
        ),
      ),
      title: Container(
        margin: const EdgeInsets.only(left: 5),
        child: Text(
          '${day.name}',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
