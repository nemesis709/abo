class UserModel {
  final String uid;
  final String email;
  final String name;
  final UserStatModel? stat;

  const UserModel({
    required this.uid,
    required this.email,
    required this.name,
    this.stat,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'name': name,
      };

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      email: json['email'],
      name: json['name'],
    );
  }

  UserModel copyWith({
    final String? uid,
    final String? email,
    final String? name,
    final UserStatModel? stat,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      stat: stat ?? this.stat,
    );
  }
}

class UserStatModel {
  final String uid;
  final int game;
  final int win;
  final int draw;
  final int lose;
  final int point;
  final double rate;

  const UserStatModel({
    required this.uid,
    required this.game,
    required this.win,
    required this.draw,
    required this.lose,
    required this.point,
    required this.rate,
  });

  factory UserStatModel.init(String uid) => UserStatModel(
        uid: uid,
        game: 0,
        win: 0,
        draw: 0,
        lose: 0,
        point: 0,
        rate: 0,
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'game': game,
        'win': win,
        'draw': draw,
        'lose': lose,
        'point': point,
        'rate': rate,
      };

  static UserStatModel fromJson(Map<String, dynamic> json) {
    return UserStatModel(
      uid: json['uid'],
      game: (json['game'] as num).toInt(),
      win: (json['win'] as num).toInt(),
      draw: (json['draw'] as num).toInt(),
      lose: (json['lose'] as num).toInt(),
      point: (json['point'] as num).toInt(),
      rate: (json['rate'] as num).toDouble(),
    );
  }
}
