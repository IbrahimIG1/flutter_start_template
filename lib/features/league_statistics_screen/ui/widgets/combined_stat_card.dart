 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_app/core/helper/spacer.dart';
import 'package:football_app/core/styles/fonts/app_text_styles.dart';
import 'package:football_app/features/league_statistics_screen/logic/models/league_statistics_model.dart';

Widget combinedStatCard(PlayerModel player) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 32.r,
              backgroundImage: NetworkImage(player.imageUrl),
            ),
            verticalSpace(8),
            Text(player.name, style: AppTextStyles().fontBlack14Bold),
            verticalSpace(4),
            Text(
              "${player.goals} Goals",
              style: AppTextStyles().fontBlue14Bold,
            ),
            Text(
              "${player.assists} Assists",
              style: AppTextStyles().fontBlue14Bold,
            ),
          ],
        ),
      ),
    );
  }