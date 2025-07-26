import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeamLogoLabel extends StatelessWidget {
  final String name;
  final String logo;

  const TeamLogoLabel({required this.name, required this.logo, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(backgroundImage: NetworkImage(logo)),
        SizedBox(height: 4.h),
        Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class MatchScore extends StatelessWidget {
  final String score;

  const MatchScore({required this.score, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      score,
      style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
    );
  }
}

class AnimatedMiniStat extends StatelessWidget {
  final String title;
  final bool isPresentage;
  final int leftValue;
  final int rightValue;

  const AnimatedMiniStat({
    super.key,
    required this.title,
    required this.isPresentage,
    required this.leftValue,
    required this.rightValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 4),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TweenAnimationBuilder<int>(
              tween: IntTween(begin: 0, end: leftValue),
              duration: const Duration(seconds: 2),
              builder:
                  (_, value, __) => Text(
                    isPresentage ? "$value%" : "$value",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            ),
            const Text(" - "),
            TweenAnimationBuilder<int>(
              tween: IntTween(begin: 0, end: rightValue),
              duration: const Duration(seconds: 2),
              builder:
                  (_, value, __) => Text(
                    isPresentage ? "$value%" : "$value",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            ),
          ],
        ),
      ],
    );
  }
}

class MatchStatRow extends StatelessWidget {
  final String left;
  final String right;
  final String label;
  final Color? color;

  const MatchStatRow({
    required this.left,
    required this.right,
    required this.label,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final barColor = color ?? Colors.deepPurple;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(left),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(label, textAlign: TextAlign.center),
                ),
              ),
              Text(right),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Expanded(
                flex: int.tryParse(left) ?? 0,
                child: Container(height: 6.h, color: Colors.red),
              ),
              Expanded(
                flex: int.tryParse(right) ?? 0,
                child: Container(height: 6.h, color: barColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MatchEvent extends StatelessWidget {
  final String time;
  final IconData icon;
  final String player;
  final String team;
  final Color iconColor;

  const MatchEvent({
    required this.time,
    required this.icon,
    required this.player,
    required this.team,
    this.iconColor = Colors.green,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        children: [
          SizedBox(width: 40.w, child: Text(time)),
          Icon(icon, size: 18.sp, color: iconColor),
          SizedBox(width: 8.w),
          Text(player, style: TextStyle(fontWeight: FontWeight.w500)),
          const Spacer(),
          Text("($team)", style: TextStyle(color: Colors.grey[600])),
        ],
      ),
    );
  }
}
