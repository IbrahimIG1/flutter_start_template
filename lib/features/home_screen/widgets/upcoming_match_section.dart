import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_app/core/helper/spacer.dart';
import 'package:football_app/core/styles/fonts/app_text_styles.dart';
import 'package:football_app/features/home_screen/logic/models/upcoming_match_model.dart';

Widget upcomingMatchSection({
  required UpcomingMatchModel upcomingMatchModel,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Container(
            width: 40.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // color: colors[index],
            ),
            child: Image.network(upcomingMatchModel.team1Logo),
          ),
          horizontalSpace(8),

          Text(upcomingMatchModel.team1, style: AppTextStyles().fontBlack16Regular),
        ],
      ),
      Column(
        children: [
          Text(upcomingMatchModel.date, style: const TextStyle(color: Colors.grey)),
          Text(upcomingMatchModel.time, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      Row(
        children: [
          Text(upcomingMatchModel.team2, style: AppTextStyles().fontBlack16Regular),
          horizontalSpace(8),
          Container(
            width: 40.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // color: colors[index],
            ),
            child: Image.network(upcomingMatchModel.team2Logo),
          ),
        ],
      ),
    ],
  );
}
