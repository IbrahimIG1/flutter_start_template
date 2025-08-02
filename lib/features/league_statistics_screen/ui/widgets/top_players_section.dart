import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_app/features/league_statistics_screen/logic/models/league_statistics_model.dart';

class TopPlayersSection extends StatelessWidget {
  const TopPlayersSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<PlayerModel> topPlayers = [
      PlayerModel(
        name: 'Player 1',
        goals: 10,
        assists: 5,
        team: 'Team 1',
        imageUrl:
            'https://machohairstyles.com/wp-content/uploads/2017/03/Cristiano-Ronaldos-Haircut-3-1469x1536.jpg',
        id: "1",
      ),
      PlayerModel(
        name: 'Player 2',
        goals: 8,
        assists: 3,
        team: 'Team 2',
        imageUrl:
            'https://ath2.unileverservices.com/wp-content/uploads/sites/4/2017/01/giroud-rex.jpg',
        id: "2",
      ),
      PlayerModel(
        name: 'Player 3',
        goals: 6,
        assists: 2,
        team: 'Team 3',
        imageUrl:
            'https://tse2.mm.bing.net/th/id/OIP.g8m8XEM4n_Jzy2khf6kmGQHaHa?w=750&h=750&rs=1&pid=ImgDetMain&o=7&rm=3',
        id: "3",
      ),
    ];
    return Container(
      height: 204.h,
      child: Container(
        height: 156.h,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              left: .5.sw - 60.w,
              child: PlayerCard(
                circleSize: 50.r,
                rank: 2,
                name: topPlayers[0].name,
                team: topPlayers[0].team,
                score: topPlayers[0].goals,
                imageUrl: topPlayers[0].imageUrl,
                borderColor: Colors.amber,
                showTrophy: true,
              ),
            ),
            Positioned(
              bottom: 20,
              right: 0.w,
              child: PlayerCard(
                circleSize: 45.r,
                rank: 2,
                name: topPlayers[1].name,
                team: topPlayers[1].team,
                score: topPlayers[1].goals,
                imageUrl: topPlayers[1].imageUrl,
                borderColor: Colors.grey,
              ),
            ),
            Positioned(
              bottom: 0.h,
              left: 20.w,
              child: PlayerCard(
                circleSize: 40.r,
                rank: 3,
                name: topPlayers[2].name,
                team: topPlayers[2].team,
                score: topPlayers[2].goals,
                imageUrl: topPlayers[2].imageUrl,
                borderColor: Colors.brown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerCard extends StatelessWidget {
  final int rank;
  final String name;
  final String team;
  final int score;
  final String imageUrl;
  final Color borderColor;
  final bool showTrophy;
  final double circleSize;

  const PlayerCard({
    super.key,
    required this.rank,
    required this.name,
    required this.team,
    required this.score,
    required this.imageUrl,
    required this.borderColor,
    this.showTrophy = false,
    required this.circleSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100.w,
          child: Stack(
            children: [
              CircleAvatar(
                radius: circleSize - 3.r,
                backgroundColor: borderColor,
                child: CircleAvatar(
                  radius: circleSize.r,
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
              if (showTrophy)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: CircleAvatar(
                    radius: circleSize / 3,
                    backgroundColor: Colors.amber,
                    child: Icon(
                      Icons.emoji_events,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              if (!showTrophy)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: CircleAvatar(
                    radius: circleSize / 3,
                    backgroundColor: borderColor,
                    child: Text(
                      '$rank',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(team, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 4),
        Text(
          '$score',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }
}
