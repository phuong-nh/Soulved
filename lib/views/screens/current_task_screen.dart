import 'package:chalie_youthon/models/challenge.dart';
import 'package:chalie_youthon/models/task.dart';
import 'package:chalie_youthon/unfinished.dart';
import 'package:chalie_youthon/views/screens/congrats_screen.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../theme.dart';

class CurrentTask extends StatefulWidget {
  final Challenge challenge;

  const CurrentTask({Key? key, required this.challenge}) : super(key: key);

  @override
  _CurrentTaskState createState() => _CurrentTaskState();
}

class _CurrentTaskState extends State<CurrentTask> {
  Challenge get challenge => widget.challenge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Ionicons.checkmark_done_circle,
          size: 50,
          color: Colors.black.withOpacity(0.8),
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => CongratsDay(challenge: challenge)));
        },
        backgroundColor: Colors.yellow,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: _dayBuild(),
      ),
    );
  }

  _dayBuild() {
    var days = challenge.days;
    Day day = days[challenge.completeCount];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTopImage(),
        Container(
          margin: EdgeInsets.only(top: 25, right: 25, left: 25),
          child: Text(
            '${day.name}',
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter',
                color: Colors.black),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15, right: 25, left: 25),
          child: Text(
            '${day.description}',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Inter',
              color: Colors.black,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 35, right: 25, left: 25),
              child: Text(
                'Hoàn thành',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 35, right: 35, left: 25),
              child: Text(
                '${day.completeCount}/${day.tasks.length}',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                  color: Colors.black,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        _taskBuild(day.tasks[0]),
        _taskBuild(day.tasks[0]),
        _taskBuild(day.tasks[0]),
        SizedBox(height: 100),
      ],
    );
  }

  Container _buildTopImage() {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6), BlendMode.dstATop),
            image: NetworkImage(imageLink(challenge.image)),
            fit: BoxFit.cover),
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
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 25, right: 25, left: 25),
                child: Text(
                  'Ngày ${challenge.completeCount + 1}/${challenge.length}',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                      color: Colors.white),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 5, right: 25, left: 25, bottom: 25),
                child: Text(
                  '${challenge.name}',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Inter',
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _taskBuild(Task task) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 25, bottom: 10),
      child: Column(
        children: [
          Row(
            children: [
              Checkbox(
                value: task.finished,
                onChanged: (selected) {
                  setState(
                    () {
                      task.finished = (task.finished) ? false : true;
                    },
                  );
                },
              ),
              Text(
                '${task.name}',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                    color: Colors.black),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              '${task.description}',
              style: TextStyle(
                  fontSize: 16, fontFamily: 'Inter', color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
