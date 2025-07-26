  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget topLeagueRowSection() {
    final logos = [
      'https://upload.wikimedia.org/wikipedia/ur/thumb/b/bf/UEFA_Champions_League_logo_2.svg/1200px-UEFA_Champions_League_logo_2.svg.png',
      'https://tse4.mm.bing.net/th/id/OIP.gAzYpuiITM7S3fyOs-iYkQHaEK?w=2048&h=1152&rs=1&pid=ImgDetMain&o=7&rm=3',
      'https://tse4.mm.bing.net/th/id/OIP.4BluRiZQnNCFViAmRhKuygHaId?rs=1&pid=ImgDetMain&o=7&rm=3',
      'https://th.bing.com/th/id/OIP.bdsVTbUgbOGPwuAn5CJlygHaHa?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3',
      'https://th.bing.com/th/id/OIP.r7fKDnfYcRk5eai4tHm8ywHaID?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3',
      'https://logodownload.org/wp-content/uploads/2016/03/premier-league-0.png',
    ];

    return SizedBox(
      height: 60.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: logos.length,
        separatorBuilder: (_, __) => SizedBox(width: 15.w),
        itemBuilder:
            (_, index) => Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // color: colors[index],
              ),
              child: Image.network(logos[index]),
            ),
      ),
    );
  }