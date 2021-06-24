import 'package:chalie_youthon/unfinished.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../theme.dart';

class BasicStats extends StatefulWidget {
  final int dayStreak = 17;
  final int point = 1452;
  final int rank = 2;

  const BasicStats({Key? key}) : super(key: key);

  @override
  _BasicStatsState createState() => _BasicStatsState();
}

class _BasicStatsState extends State<BasicStats> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildAchivement(),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10,left: 25, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildRank(context),
              _buildScore(context),
            ],
          ),
        )
      ],
    );
  }

  Container _buildScore(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: (MediaQuery.of(context).size.width - 60) * 0.5,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Điểm",
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SizedBox(height: 7),
          Text(
            "${widget.point}",
            style: TextStyle(
              fontSize: 42,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              color: Colors.black.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildRank(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 100,
      width: (MediaQuery.of(context).size.width - 60) * 0.5,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Hạng",
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SizedBox(height: 7),
          Text(
            "#${widget.rank}",
            style: TextStyle(
              fontSize: 42,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              color: Colors.black.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildAchivement() {
    return Container(
      margin: EdgeInsets.only(top: 15,left: 25,right: 25),
      padding: EdgeInsets.only(left: 15, right: 7),
      height: 40,
      // width: (MediaQuery.of(context).size.width - 50),
      // alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 2),
        color: Colors.black12.withOpacity(0.05),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Mở khóa huy hiệu: 10 ngày liên tục",
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          Icon(
            Ionicons.checkmark_circle,
            size: 28,
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
