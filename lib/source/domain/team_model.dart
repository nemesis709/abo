class TeamModel {
  final String ground;
  final String team;
  final num parkFactor;

  TeamModel({
    required this.ground,
    required this.team,
    required this.parkFactor,
  });

  Map toJson() => {
        'ground': ground,
        'team': team,
        'parkFactor': parkFactor,
      };

  static TeamModel fromJson(Map json) {
    return TeamModel(
      ground: json['ground'],
      team: json['team'],
      parkFactor: json['parkFactor'],
    );
  }
}
