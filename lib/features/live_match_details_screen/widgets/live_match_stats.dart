  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_app/core/helper/spacer.dart';
import 'package:football_app/features/live_match_details_screen/widgets/match_stat_row.dart';

Widget liveMatchStatsAnimated() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Match Stats",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
      verticalSpace(16),
        _animatedStat("Ball Possession", 58, 42, Colors.red),
        _animatedStat("Total Shots", 15, 8),
        _animatedStat("Shots on Target", 7, 3),
        _animatedStat("Corners", 6, 4),
        _animatedStat("Fouls", 12, 10),
        _animatedStat("Yellow Cards", 2, 3),
      ],
    );
  }  Widget _animatedStat(String label, int left, int right, [Color? color]) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 800),
      builder: (context, value, _) {
        return MatchStatRow(
          label: label,
          left: (left).toString(),
          right: (right).toString(),
          color: color,
        );
      },
    );
  }