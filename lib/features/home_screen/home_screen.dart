import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_app/core/helper/spacer.dart';
import 'package:football_app/core/styles/fonts/app_text_styles.dart';
import 'package:football_app/features/home_screen/logic/models/upcoming_match_model.dart';
import 'package:football_app/features/home_screen/widgets/live_match_card.dart';
import 'package:football_app/features/home_screen/widgets/section_header_item.dart';
import 'package:football_app/features/home_screen/widgets/top_league_row_ection.dart';
import 'package:football_app/features/home_screen/widgets/upcoming_match_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // upcoming Matches list Data
    List<UpcomingMatchModel> upcomingMatches = [
      UpcomingMatchModel(
        team1Logo:
            "https://th.bing.com/th/id/OIP.Bd6wsfoqvO9fhkx7Ru2yawHaHa?w=191&h=190&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
        team1: 'Barcelona',
        date: 'Today',
        time: '08:00 PM',
        team2: 'Real Madrid',
        team2Logo:
            'https://tse4.mm.bing.net/th/id/OIP.hbNbAGbYiCas7AGWplUOMgAAAA?rs=1&pid=ImgDetMain&o=7&rm=3',
      ),
      UpcomingMatchModel(
        team1Logo:
            'https://tse4.mm.bing.net/th/id/OIP.iHQxSyxUIPLyASWY2wUomgHaE7?rs=1&pid=ImgDetMain&o=7&rm=3',
        team1: 'Liverpool',
        date: 'Saturday',
        time: '09:00 PM',
        team2: 'Man City',
        team2Logo:
            'https://tse2.mm.bing.net/th/id/OIP.q_nOCN8jaOOi-UGTHuciJAHaF7?rs=1&pid=ImgDetMain&o=7&rm=3',
      ),
      UpcomingMatchModel(
        team1Logo:
            "https://th.bing.com/th/id/OIP.Bd6wsfoqvO9fhkx7Ru2yawHaHa?w=191&h=190&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
        team1: 'Barcelona',
        date: 'Today',
        time: '08:00 PM',
        team2: 'Real Madrid',
        team2Logo:
            'https://tse4.mm.bing.net/th/id/OIP.hbNbAGbYiCas7AGWplUOMgAAAA?rs=1&pid=ImgDetMain&o=7&rm=3',
      ),
      UpcomingMatchModel(
        team1Logo:
            'https://tse4.mm.bing.net/th/id/OIP.iHQxSyxUIPLyASWY2wUomgHaE7?rs=1&pid=ImgDetMain&o=7&rm=3',
        team1: 'Liverpool',
        date: 'Saturday',
        time: '09:00 PM',
        team2: 'Man City',
        team2Logo:
            'https://tse2.mm.bing.net/th/id/OIP.q_nOCN8jaOOi-UGTHuciJAHaF7?rs=1&pid=ImgDetMain&o=7&rm=3',
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('Balbalan', style: AppTextStyles().fontBlack20Bold),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sectionHeaderItem('Top League'),
               verticalSpace( 12),
              topLeagueRowSection(),
               verticalSpace( 24),
              sectionHeaderItem('Live Match'),
               verticalSpace( 16),
              liveMatchCard(context: context),
               verticalSpace( 55),
              sectionHeaderItem('Upcoming Match'),
               verticalSpace( 12),
              ...upcomingMatches.map(
                (e) => Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: upcomingMatchSection(upcomingMatchModel: e),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
