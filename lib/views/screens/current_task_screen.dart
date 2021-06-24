import 'package:chalie_youthon/models/challenge.dart';
import 'package:chalie_youthon/models/task.dart';
import 'package:chalie_youthon/unfinished.dart';
import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        child: _dayBuild(),
      ),
    );
  }

  _dayBuild() {
    var days = challenge.days;
    Day day = days[challenge.completeCount];
    return SafeArea(
          child: Column(
        children: [
          Text('Ngày ${challenge.completeCount + 1}/${challenge.length}'),
          Text('${challenge.name}'),
          Text('${day.name}'),
          Text('Hoàn thành ${day.completeCount}/${day.tasks.length}'),
        ],
      ),
    );
  }
}
