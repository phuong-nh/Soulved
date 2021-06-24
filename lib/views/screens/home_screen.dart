import 'package:chalie_youthon/unfinished.dart';
import 'package:chalie_youthon/views/screens/discover_screen.dart';
import 'package:chalie_youthon/views/theme.dart';
import 'package:chalie_youthon/views/widgets/current_challenge.dart';
import 'package:chalie_youthon/views/widgets/discover.dart';
import 'package:chalie_youthon/views/widgets/stats_overview.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final double margin = 25;
  final double avatarSize = 70;
  final String timeSession = "buổi sáng";
  final String username = "Frontliners";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _welcome(context),
              BasicStats(),
              _intro(context, "Tiếp tục nào"),
              CurrentChallenge(),
              _buildDiscoverIntro(context),
              Discover(),
              SizedBox(height: 30),
              _copyright(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Center _copyright() {
    return Center(
      child: Text(
        'Made by Frontliners',
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w200, fontFamily: 'Inter'),
      ),
    );
  }

  Widget _welcome(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 25, 25, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: avatarSize,
            height: avatarSize,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$username',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter'),
              ),
              Text(
                'Cố gắng lên nào ✊',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDiscoverIntro(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => DiscoverScreen()))
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _intro(context, "Khám phá"),
          Container(
            child: Text(
              'Xem thêm',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            margin: EdgeInsets.only(right: 25),
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
}
