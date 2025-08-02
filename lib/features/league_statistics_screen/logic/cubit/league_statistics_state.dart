import 'package:equatable/equatable.dart';
import 'package:football_app/features/league_statistics_screen/logic/models/league_statistics_model.dart';

abstract class StatisticsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class StatisticsInitial extends StatisticsState {}

class StatisticsLoading extends StatisticsState {}

class StatisticsError extends StatisticsState {
  String message;

  StatisticsError( this.message);
}

enum StatsTab { topScorers, topAssists }

class StatisticsLoaded extends StatisticsState {
  final List<PlayerModel> topScorers;
  final List<PlayerModel> topAssists;
  final List<PlayerModel> combinedStats;
  final StatsTab selectedTab;

  StatisticsLoaded({
    required this.topScorers,
    required this.topAssists,
    required this.combinedStats,
    this.selectedTab = StatsTab.topScorers,
  });

  StatisticsLoaded copyWith({
    List<PlayerModel>? topScorers,
    List<PlayerModel>? topAssists,
    List<PlayerModel>? combinedStats,
    StatsTab? selectedTab,
  }) {
    return StatisticsLoaded(
      topScorers: topScorers ?? this.topScorers,
      topAssists: topAssists ?? this.topAssists,
      combinedStats: combinedStats ?? this.combinedStats,
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }

  @override
  List<Object?> get props => [topScorers, topAssists, combinedStats, selectedTab];
}


