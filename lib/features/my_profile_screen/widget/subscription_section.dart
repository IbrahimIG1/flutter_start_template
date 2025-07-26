import 'package:flutter/material.dart';
import 'package:football_app/features/my_profile_screen/widget/profile_card.dart';

class SubscriptionSection extends StatelessWidget {
  const SubscriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Subscription',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 16),
        ProfileCard(
          icon: Icons.star_border,
          title: 'Premium Plan',
          subtitle: 'Expires on December 31, 2024',
        ),
        ProfileCard(
          icon: Icons.star_border,
          title: 'Premium Plan',
          subtitle: 'Expires on December 31, 2024',
        ),
        ProfileCard(
          icon: Icons.star_border,
          title: 'Premium Plan',
          subtitle: 'Expires on December 31, 2024',
        ),
      ],
    );
  }
}
