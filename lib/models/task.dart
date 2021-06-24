import 'package:flutter/material.dart';

class Day {
  final List<Task> tasks = [];
  final String name, description, id;
  bool finished;

  Day({this.name = '', this.finished = false, this.description = '', this.id=''});

  int get completeCount => tasks.where((task) => task.finished).length;
  int get taskLeft => tasks.where((task) => !task.finished).length;
}

class Task {
  final String name, description, id;
  final int point;
  bool finished;

  Task({
    this.name = '',
    this.description = '',
    this.point = 0,
    this.finished = false,
    this.id ='',
  });
}
