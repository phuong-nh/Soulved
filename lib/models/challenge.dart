import 'package:flutter/material.dart';
import 'task.dart';

class Challenge {
  List<Day> days = [];
  String name = '', tag = '', creator = '', description = '', image = '', userimage = '';
  double rating = 0.0;
  bool doing = false, finished = false, saved = false;
  int finisher = 0, length = 0, current = 0, id = 0;

  Challenge({
    this.finisher = 0,
    this.image = '',
    this.saved = false,
    this.rating = 0,
    this.doing = false,
    this.finished = false,
    this.name = '',
    this.length = 0,
    this.tag = '',
    this.creator = '',
    this.description = '',
    this.current = 0,
    this.id = 0,
  });

  Challenge.fromJson(Map<String, dynamic> json) {
    creator = json['creator'];
    if (json['days'] != null) {
      days = <Day>[];
      json['days'].forEach((v) {
        days.add(new Day.fromJson(v));
      });
    }
    description = json['description'];
    finisher = json['finisher'];
    image = json['image'];
    length = json['length'];
    name = json['name'];
    rating = json['rating'];
    id = json['id'];
    tag = json['tag'];
    doing = json['doing'] ?? false;
    saved = json['saved'] ?? false;
    finished = json['finished'] ?? false;
    userimage = json['userimage'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['creator'] = this.creator;
    data['id'] = this.id;
    if (this.days != null) {
      data['days'] = this.days.map((v) => v.toJson()).toList();
    }
    data['tag'] = this.tag;
    data['description'] = this.description;
    data['finisher'] = this.finisher;
    data['image'] = this.image;
    data['length'] = this.length;
    data['name'] = this.name;
    data['rating'] = this.rating;
    data['doing'] = this.doing;
    data['saved'] = this.saved;
    data['finished'] = this.finished;
    data['userimage'] = this.userimage;
    return data;
  }

  // Challenge.fromJson(Map<String, dynamic> json)
  //   : name=json['name'],description=json['description'],;

  int get completeCount => days.where((task) => task.finished).length;
  int get dayLeft => days.where((task) => !task.finished).length;
}
