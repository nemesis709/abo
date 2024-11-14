enum Team {
  Kiwoom('키움', 'Hero'),
  Hanwha('한화', '한화'),
  Lotte('롯데', '롯데'),
  Doosan('두산', '두산'),
  Samsung('삼성', '삼성'),
  LG('LG', 'LG'),
  Kia('KIA', 'KIA'),
  KT('KT', 'KT'),
  SSG('SSG', 'SSG'),
  NC('NC', 'NC');

  final String name;
  final String serverName;

  const Team(this.name, this.serverName);
}

class TeamModel {
  final String ground;
  final Team team;
  final num parkFactor;

  TeamModel({
    required this.ground,
    required this.team,
    required this.parkFactor,
  });

  Map toJson() => {
        'ground': ground,
        'team': team.serverName,
        'parkFactor': parkFactor,
      };

  static TeamModel fromJson(Map json) {
    return TeamModel(
      ground: json['ground'],
      team: Team.values.firstWhere((e) => e.serverName == json['team']),
      parkFactor: json['parkFactor'],
    );
  }
}
