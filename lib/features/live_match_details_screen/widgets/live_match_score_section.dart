import 'package:flutter/material.dart';
import 'package:football_app/core/helper/spacer.dart';
import 'package:football_app/features/live_match_details_screen/widgets/match_stat_row.dart';

Widget liveMatchScoreSection() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TeamLogoLabel(
            name: "Arsenal",
            logo:
                "https://th.bing.com/th/id/R.810318304507983d925acc415fc1b3e1?rik=6N9vCf%2fEp5wITA&pid=ImgRaw&r=0",
          ),
          Column(
            children: [
              MatchScore(score: "2 - 1"),
              verticalSpace(2),
              Text("FULL TIME", style: TextStyle(color: Colors.red)),
            ],
          ),
          TeamLogoLabel(
            name: "Man United",
            logo:
                'https://icdn.caughtoffside.com/wp-content/uploads/2023/12/manchester-united-f.c.-news-pic.jpg',
          ),
        ],
      ),
    ],
  );
}
