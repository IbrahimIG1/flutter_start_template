import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_app/core/di/di.dart';
import 'package:football_app/core/helper/spacer.dart';
import 'package:football_app/features/home_screen/home_screen.dart';
import 'package:football_app/features/layout_screen/ui/widget/custom_bottom_nav_bar.dart';
import 'package:football_app/features/layout_screen/logic/layout_cubit.dart';
import 'package:football_app/features/league_statistics_screen/ui/league_statistics_screen.dart';
import 'package:football_app/features/my_profile_screen/my_profile_screen.dart';

class LayoutScreen extends StatelessWidget {
  LayoutScreen({super.key});

  final List<Widget> screens = [
    HomeScreen(),
    LeagueStatisticsScreen(), // Replace with NewsScreen()
    HomeScreen(), // Replace with StoreScreen()
    MyProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LayoutCubit>(),
      child: BlocBuilder<LayoutCubit, int>(
        builder: (context, selectedIndex) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                // Screen content
                Positioned.fill(child: screens[selectedIndex]),

                // Bottom nav + FAB
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      CustomPaint(
                        size: Size(1.sw, 60.h),
                        painter: CustomBottomNavPainter(),
                      ),
                      Positioned(
                        top: -25.h,
                        child: FloatingActionButton(
                          onPressed: () {
                            // TODO: Add live screen navigation here
                          },
                          backgroundColor: Colors.deepPurple,
                          elevation: 8,
                          shape: const CircleBorder(),
                          child: const Icon(Icons.live_tv, color: Colors.white),
                        ),
                      ),
                      Positioned(
                        bottom: 10.h,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            BottomNavItem(
                              icon: Icons.home,
                              label: 'Home',
                              selected: selectedIndex == 0,
                              onTap:
                                  () =>
                                      context.read<LayoutCubit>().changeTab(0),
                            ),
                            BottomNavItem(
                              icon: Icons.article,
                              label: 'News',
                              selected: selectedIndex == 1,
                              onTap:
                                  () =>
                                      context.read<LayoutCubit>().changeTab(1),
                            ),
                            horizontalSpace(30),
                            BottomNavItem(
                              icon: Icons.store,
                              label: 'Store',
                              selected: selectedIndex == 2,
                              onTap:
                                  () =>
                                      context.read<LayoutCubit>().changeTab(2),
                            ),
                            BottomNavItem(
                              icon: Icons.person,
                              label: 'Profile',
                              selected: selectedIndex == 3,
                              onTap:
                                  () =>
                                      context.read<LayoutCubit>().changeTab(3),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
