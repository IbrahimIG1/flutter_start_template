import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_app/core/helper/spacer.dart';
import 'package:football_app/features/live_match_details_screen/widgets/live_match_mini_stats.dart';
import 'package:football_app/features/live_match_details_screen/widgets/live_match_score_section.dart';
import 'package:football_app/features/live_match_details_screen/widgets/live_match_stats.dart';
import 'package:football_app/features/live_match_details_screen/widgets/live_match_timeline.dart';
import 'package:football_app/features/live_match_details_screen/widgets/match_header_section.dart';

class LiveMatchDetailsScreen extends StatefulWidget {
  const LiveMatchDetailsScreen({super.key});

  @override
  State<LiveMatchDetailsScreen> createState() => _LiveMatchDetailsScreenState();
}

class _LiveMatchDetailsScreenState extends State<LiveMatchDetailsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  bool _animate = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _animate = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // ================== Build UI ===================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView(
          children: [
            SlideTransition(
              position: _slideAnimation,
              child: matchHeaderSection(),
            ),
            verticalSpace(20),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _animate ? 1 : 0,
              child: liveMatchScoreSection(),
            ),
            verticalSpace(20),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 700),
              opacity: _animate ? 1 : 0,
              child: liveMatchMiniStats(),
            ),
            SizedBox(height: 20.h),
            liveMatchStatsAnimated(),
            verticalSpace(20),

            liveMatchTimelineAnimated(_animate),
          ],
        ),
      ),
    );
  }
}
