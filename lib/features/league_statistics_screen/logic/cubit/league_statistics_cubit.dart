import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/features/league_statistics_screen/logic/cubit/league_statistics_state.dart';

import 'package:football_app/features/league_statistics_screen/logic/models/league_statistics_model.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  StatisticsCubit() : super(StatisticsInitial());

  static StatisticsCubit get(context) => BlocProvider.of(context);

  Future<void> loadStatistics() async {
    emit(StatisticsLoading());

    try {
      // Simulated API call – replace this with real repository call
      await Future.delayed(Duration(seconds: 2));

      final scorers = [
        PlayerModel(
          id: '1',
          name: 'Alex Thompson',
          team: 'United FC',
          imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
          goals: 32,
          assists: 8,
        ),
        PlayerModel(
          id: '2',
          name: 'James Wilson',
          team: 'City SC',
          imageUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
          goals: 28,
          assists: 5,
        ),
        PlayerModel(
          id: '3',
          name: 'Michael Brown',
          team: 'Athletic',
          imageUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
          goals: 24,
          assists: 3,
        ),
        PlayerModel(
          id: '4',
          name: 'Mohamed Salah',
          team: 'Liverpool',
          imageUrl:
              'https://images.performgroup.com/di/library/GOAL/ff/29/mohamed-salah-liverpool-2018-19_1q5vydk4acj1t1urd1ewvibpii.jpg?t=1464779801&quality=100',
          goals: 27,
          assists: 12,
        ),
        PlayerModel(
          id: '5',
          name: 'Gabriel Jesus',
          team: 'Arsenal',
          imageUrl: 'https://randomuser.me/api/portraits/men/5.jpg',
          goals: 25,
          assists: 7,
        ),
      ];

      final assists = scorers..sort((a, b) => b.assists.compareTo(a.assists));

      final combined = [
        PlayerModel(
          id: '6',
          name: 'Kevin De Bruyne',
          team: 'Man City',
          imageUrl:
              'https://img.particlenews.com/img/id/2reTss_0tPVsX3300?type=thumbnail_1600x1200',
          goals: 12,
          assists: 16,
        ),
        scorers.firstWhere((e) => e.name == 'Mohamed Salah'),
      ];

      emit(
        StatisticsLoaded(
          topScorers: scorers,
          topAssists: assists,
          combinedStats: combined,
        ),
      );
    } catch (e) {
      emit(StatisticsError('Failed to load statistics.'));
    }
  }

  void changeTab(StatsTab tab) {
    final currentState = state;
    if (currentState is StatisticsLoaded) {
      emit(currentState.copyWith(selectedTab: tab));
    }
  }
}
