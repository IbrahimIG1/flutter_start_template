import 'package:sandwich_app/core/helper/app_images.dart';
import 'package:sandwich_app/core/helper/extension.dart';
import 'package:sandwich_app/core/network/urls/api_constants%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget notificationItemProfileImage(String imageUrl) {
  return ClipOval(
    child:
        imageUrl.isNullOrEmpty()
            ? Image.asset(
              AppImages().logo,
              width: 36.w,
              height: 36.h,
              fit: BoxFit.cover,
            )
            : Image.network(
              "${ApiConstants.getImage}$imageUrl",
              width: 36.w,
              height: 36.h,
              fit: BoxFit.cover,
            ),
  );
}
