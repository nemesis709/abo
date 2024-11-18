class UserModel {
  final String uid;
  final int teamKey; // 일정에서 팀에 매칭할 키
  final String name;
  final int game;
  final int win;
  final int draw;
  final int lose;
  final int point;
  final double rate;

  const UserModel({
    required this.uid,
    required this.teamKey,
    required this.name,
    required this.game,
    required this.win,
    required this.draw,
    required this.lose,
    required this.point,
    required this.rate,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'team_key': teamKey,
        'games_played': game,
        'wins': win,
        'draws': draw,
        'losses': lose,
        'points': point,
        'win_rate': rate,
      };

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      teamKey: json['team_key'],
      name: json['name'],
      game: json['games_played'],
      win: json['wins'],
      draw: json['draws'],
      lose: json['losses'],
      point: json['points'],
      rate: (json['win_rate'] as num).toDouble(),
    );
  }

  UserModel copyWith({
    final String? uid,
    final int? teamKey,
    final String? name,
    final int? game,
    final int? win,
    final int? draw,
    final int? lose,
    final int? point,
    final double? rate,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      teamKey: teamKey ?? this.teamKey,
      name: name ?? this.name,
      game: game ?? this.game,
      win: win ?? this.win,
      draw: draw ?? this.draw,
      lose: lose ?? this.lose,
      point: point ?? this.point,
      rate: rate ?? this.rate,
    );
  }
}
