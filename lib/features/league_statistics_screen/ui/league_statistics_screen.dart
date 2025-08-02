import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_app/core/helper/spacer.dart';
import 'package:football_app/core/styles/fonts/app_text_styles.dart';
import 'package:football_app/features/league_statistics_screen/logic/cubit/league_statistics_cubit.dart';
import 'package:football_app/features/league_statistics_screen/logic/cubit/league_statistics_state.dart';
import 'package:football_app/features/league_statistics_screen/logic/models/league_statistics_model.dart';
import 'package:football_app/features/league_statistics_screen/ui/widgets/combined_stat_card.dart';
import 'package:football_app/features/league_statistics_screen/ui/widgets/top_players_section.dart';

class LeagueStatisticsScreen extends StatelessWidget {
  const LeagueStatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatisticsCubit()..loadStatistics(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "League Statistics",
            style: AppTextStyles().fontBlack16Bold,
          ),
          leading: const BackButton(),
          actions: const [Icon(Icons.filter_list)],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0.w),
              child: BlocBuilder<StatisticsCubit, StatisticsState>(
                builder: (context, state) {
                  if (state is StatisticsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is StatisticsLoaded) {
                    final cubit = context.read<StatisticsCubit>();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTabBar(cubit: cubit, state: state.selectedTab),
                        verticalSpace(30),
                        TopPlayersSection(),
                        verticalSpace(30),
                        ...state.combinedStats.map((p) => _buildPlayerTile(p)),
                        verticalSpace(30),
                        Text(
                          "Combined Stats Leaders",
                          style: AppTextStyles().fontBlack16Bold,
                        ),
                        verticalSpace(30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:
                              state.combinedStats
                                  .map((p) => combinedStatCard(p))
                                  .toList(),
                        ),
                        verticalSpace(50),
                      ],
                    );
                  } else {
                    return const Center(child: Text("Failed to load"));
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar({
    required StatsTab state,
    required StatisticsCubit cubit,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTab(
          title: "Top Scorers",
          selected: state.index == 0,
          onTap: () => cubit.changeTab(state),
        ),
        horizontalSpace(10),
        _buildTab(
          title: "Top Assists",
          selected: state.index == 1,
          onTap: () => cubit.changeTab(state),
        ),
      ],
    );
  }

  Widget _buildTab({
    required String title,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Text(
          title,
          style:
              selected
                  ? AppTextStyles().fontBlack14Bold
                  : AppTextStyles().fontGrey14Regular,
        ),
      ),
    );
  }

  Widget _buildPlayerTile(PlayerModel player) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(player.imageUrl)),
      title: Text(player.name, style: AppTextStyles().fontBlack14Bold),
      subtitle: Text(player.team, style: AppTextStyles().fontGrey12Regular),
      trailing: Text(
        player.goals.toString(),
        style: AppTextStyles().fontBlue14Bold,
      ),
    );
  }
}
