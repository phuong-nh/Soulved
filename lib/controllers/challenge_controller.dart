import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:localstore/localstore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/challenge.dart';
import '../models/task.dart';
import 'dart:convert';

class ChallengeController {
  final _db = Localstore.instance;
  final _challenges = <Challenge>[];

  List<Challenge> get challenges => List.unmodifiable(_challenges);

  bool _existed(int id) {
    for (var challenge in _challenges) if (challenge.id == id) return true;
    return false;
  }

  void startup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? challenges = prefs.getString('challenges');
    if (challenges != null) {
      var shareJson = jsonDecode(challenges);
      shareJson.forEach((j) {
        if (!_existed(j['id'])) _challenges.add(new Challenge.fromJson(j));
      });
    }
    String url =
        'https://firebasestorage.googleapis.com/v0/b/frontliners-chalie.appspot.com/o/data%2Fchallenges.json?alt=media';
    final response = await http.get(Uri.parse(url));
    print(utf8.decode(response.bodyBytes));
    var json = jsonDecode(utf8.decode(response.bodyBytes));
    json.forEach((j) {
      if (!_existed(j['id'])) _challenges.add(new Challenge.fromJson(j));
    });
  }

  void saveAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String challenges = jsonEncode(_challenges.map((v) => v.toJson()).toList());
    prefs.setString('challenges', challenges);
  }

  void joinChallenge(Challenge challenge) {
    challenge.doing=true;
  }

  void updateChallenge() {}
}
