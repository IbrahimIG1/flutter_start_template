class PlayerModel {
  final String id;
  final String name;
  final String team;
  final String imageUrl;
  final int goals;
  final int assists;

  PlayerModel({
    required this.id,
    required this.name,
    required this.team,
    required this.imageUrl,
    required this.goals,
    required this.assists,
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    return PlayerModel(
      id: json['id'],
      name: json['name'],
      team: json['team'],
      imageUrl: json['imageUrl'],
      goals: json['goals'],
      assists: json['assists'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'team': team,
      'imageUrl': imageUrl,
      'goals': goals,
      'assists': assists,
    };
  }
}
