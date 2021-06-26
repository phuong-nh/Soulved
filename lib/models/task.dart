import 'package:flutter/material.dart';

class Day {
  List<Task> tasks = [];
  String name = '', description = '', id = '',userimage='';
  bool finished = false;

  Day(
      {this.name = '',
      this.finished = false,
      this.description = '',
      this.id = ''});

  Day.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    name = json['name'];
    finished = json['finished'] ?? false;
    userimage = json['userimage'] ?? '';

    json['tasks'].forEach((v) {
      tasks.add(new Task.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['name'] = this.name;
    data['finished'] = this.finished;
    if (this.tasks != null) {
      data['tasks'] = this.tasks.map((v) => v.toJson()).toList();
    }
    return data;
  }

  int get completeCount => tasks.where((task) => task.finished).length;
  int get taskLeft => tasks.where((task) => !task.finished).length;
}

class Task {
  String name = '', description = '', id = '';
  int point = 0;
  bool finished = false;

  Task({
    this.name = '',
    this.description = '',
    this.point = 0,
    this.finished = false,
    this.id = '',
  });

  Task.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    name = json['name'];
    point = json['point'];
    finished = json['finished'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['name'] = this.name;
    data['point'] = this.point;
    data['finished'] = this.finished;
    return data;
  }
}
