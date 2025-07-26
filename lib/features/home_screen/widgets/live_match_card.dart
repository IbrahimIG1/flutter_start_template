import 'package:flutter/material.dart';
import 'package:football_app/features/live_match_details_screen/live_match_details_screen.dart';

Widget liveMatchCard({required BuildContext context}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => LiveMatchDetailsScreen()),
      );
    },
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2E0062),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Premier League',
                style: TextStyle(color: Colors.white),
              ),
              const Spacer(),
              Text('90+5', style: TextStyle(color: Colors.pinkAccent)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://icdn.caughtoffside.com/wp-content/uploads/2023/12/manchester-united-f.c.-news-pic.jpg',
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text('Man Utd', style: TextStyle(color: Colors.white)),
                ],
              ),
              const Text(
                '3 : 2',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Row(
                children: [
                  const Text('Forest', style: TextStyle(color: Colors.white)),
                  const SizedBox(width: 8),
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://th.bing.com/th/id/R.810318304507983d925acc415fc1b3e1?rik=6N9vCf%2fEp5wITA&pid=ImgRaw&r=0',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
