import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 48,
          backgroundImage: NetworkImage(
            'https://randomuser.me/api/portraits/men/1.jpg',
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Ibrahim Magdy',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        const Text('@Alkassas.Node', style: TextStyle(color: Colors.grey)),
        const Text('Joined in 2025', style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
