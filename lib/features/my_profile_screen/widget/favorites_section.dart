import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_app/core/helper/spacer.dart';

class FavoritesSection extends StatelessWidget {
  const FavoritesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = [
      {
        'name': 'Man City',
        'image':
            'https://tse2.mm.bing.net/th/id/OIP.q_nOCN8jaOOi-UGTHuciJAHaF7?rs=1&pid=ImgDetMain&o=7&rm=3',
      },
      {
        'name': 'Barcelona FC',
        'image':
            'https://th.bing.com/th/id/OIP.Bd6wsfoqvO9fhkx7Ru2yawHaHa?w=191&h=190&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
      },
      {
        'name': 'Real Madrid',
        'image':
            'https://tse4.mm.bing.net/th/id/OIP.hbNbAGbYiCas7AGWplUOMgAAAA?rs=1&pid=ImgDetMain&o=7&rm=3',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Favorites',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        verticalSpace(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:
              favorites
                  .map(
                    (club) => Column(
                      children: [
                        Container(
                          width: 60.w,
                          height: 60.h,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            club['image']!,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          club['name']!,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  )
                  .toList(),
        ),
      ],
    );
  }
}
