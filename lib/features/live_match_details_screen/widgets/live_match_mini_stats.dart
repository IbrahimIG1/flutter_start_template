import 'package:flutter/material.dart';
import 'package:football_app/features/live_match_details_screen/widgets/match_stat_row.dart';

Widget liveMatchMiniStats() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: const [
      AnimatedMiniStat(
        title: "Possession",
        leftValue: 58,
        rightValue: 42,
        isPresentage: true,
      ),
      AnimatedMiniStat(
        title: "Shots",
        leftValue: 15,
        rightValue: 8,
        isPresentage: false,
      ),
      AnimatedMiniStat(
        title: "On Target",
        leftValue: 7,
        rightValue: 3,
        isPresentage: false,
      ),
    ],
  );
}
