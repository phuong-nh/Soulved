import 'package:flutter/material.dart';
import 'task.dart';

class Challenge {
  final List<Day> days = [];
  final String name,
      challengeID,
      tags,
      creator,
      description,
      image;
  final double rating;
  final bool doing, finished, saved;
  final Color color;
  final int finisher,length,current;

  Challenge({
    this.color = Colors.green,
    this.finisher = 0,
    this.image ='',
    this.saved = false,
    this.rating = 0,
    this.doing = false,
    this.finished = false,
    this.name = '',
    this.challengeID = '',
    this.length = 0,
    this.tags = '',
    this.creator = '',
    this.description = '',
    this.current = -1,
  });

  int get completeCount => days.where((task) => task.finished).length;
  int get dayLeft => days.where((task) => !task.finished).length;
}
