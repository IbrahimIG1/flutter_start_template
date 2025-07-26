import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_app/core/helper/spacer.dart';

Widget matchHeaderSection() {
  return Column(
    children: [
      Text(
        "Premier League • Matchday 24",
        style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
      ),
      verticalSpace(4),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.location_on_outlined, size: 16),
          horizontalSpace(4),

          Text("Emirates Stadium •", style: TextStyle(color: Colors.grey[600])),
          horizontalSpace(4),

          const Icon(Icons.access_time_outlined, size: 16),
          horizontalSpace(4),
          Text("20:45", style: TextStyle(color: Colors.grey[600])),
        ],
      ),
    ],
  );
}
