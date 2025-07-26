import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_app/core/helper/spacer.dart';
import 'package:football_app/features/my_profile_screen/widget/favorites_section.dart';
import 'package:football_app/features/my_profile_screen/widget/profile_header.dart';
import 'package:football_app/features/my_profile_screen/widget/purchases_section.dart';
import 'package:football_app/features/my_profile_screen/widget/subscription_section.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              verticalSpace(24),
              ProfileHeader(),
              verticalSpace(32),

              FavoritesSection(),
              verticalSpace(32),

              PurchasesSection(),
              verticalSpace(32),

              SubscriptionSection(),
              verticalSpace(60),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      forceMaterialTransparency: true,
      elevation: 0,
      centerTitle: true,
      title: const Text('Profile', style: TextStyle(color: Colors.black)),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: Icon(Icons.message_outlined, color: Colors.black),
        ),
      ],
    );
  }
}
