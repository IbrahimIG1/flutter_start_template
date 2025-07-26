import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_app/features/live_match_details_screen/widgets/match_stat_row.dart';

Widget liveMatchTimelineAnimated(bool animate) {
    final items = [
      MatchEvent(
        time: "67'",
        icon: Icons.sports_soccer,
        player: "Antony",
        team: "MUN",
      ),
      MatchEvent(
        time: "51'",
        icon: Icons.sports_soccer,
        player: "Mohamed Salah",
        team: "LIV",
      ),
      MatchEvent(
        time: "45+2'",
        icon: Icons.square,
        iconColor: Colors.yellow,
        player: "Bruno Fernandes",
        team: "MUN",
      ),
      MatchEvent(
        time: "23'",
        icon: Icons.sports_soccer,
        player: "Marcus Rashford",
        team: "MUN",
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Match Timeline",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16.h),
        ...List.generate(items.length, (i) {
          return AnimatedOpacity(
            duration: Duration(milliseconds: 400 + (i * 100)),
            opacity: animate ? 1 : 0,
            child: items[i],
          );
        }),
      ],
    );
  }