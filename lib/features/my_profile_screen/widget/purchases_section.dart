import 'package:flutter/material.dart';
import 'package:football_app/features/my_profile_screen/widget/profile_card.dart';

class PurchasesSection extends StatelessWidget {
  const PurchasesSection();

  @override
  Widget build(BuildContext context) {
    final purchases = [
      {'title': 'Official Team Jersey', 'order': '#123456789'},
      {'title': 'Team Scarf', 'order': '#987654321'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Purchases',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 16),
        ...purchases.map(
          (item) => ProfileCard(
            icon: Icons.sports_soccer,
            title: item['title']!,
            subtitle: 'Order ${item['order']}',
          ),
        ),
      ],
    );
  }
}
