import 'package:flutter/material.dart';

class Day {
  final List<Task> tasks = [];
  final String name;
  final bool finished;

  Day({this.name = '', this.finished = false});

  int get completeCount => tasks.where((task) => task.finished).length;
  int get taskLeft => tasks.where((task) => !task.finished).length;
}

class Task {
  final String name, description;
  final int point;
  final bool finished;

  Task({
    this.name = '',
    this.description = '',
    this.point = 0,
    this.finished = false,
  });
}
