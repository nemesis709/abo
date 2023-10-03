class PlayerModel {
  final String id;
  final String name;
  final String birthDate;
  final String backNumber;
  final String throwHand;
  final String batHand;
  final String spec;
  final String position;
  final String team;
  final String owner;
  final bool isPitcher;

  PlayerModel({
    required this.id,
    required this.name,
    required this.birthDate,
    required this.backNumber,
    required this.throwHand,
    required this.batHand,
    required this.spec,
    required this.position,
    required this.team,
    required this.owner,
    required this.isPitcher,
  });

  Map toJson() => {
        'id': id,
        'name': name,
        'birthDate': birthDate,
        'backNumber': backNumber,
        'throwHand': throwHand,
        'batHand': batHand,
        'spec': spec,
        'position': position,
        'team': team,
        'owner': owner,
      };

  static PlayerModel fromJson(Map json, bool isPitcher) {
    return PlayerModel(
      id: json['id'],
      name: json['name'],
      birthDate: json['birthDate'],
      backNumber: json['backNumber'],
      throwHand: json['throwHand'],
      batHand: json['batHand'],
      spec: json['spec'],
      position: json['position'],
      team: json['team'] == 'Hero' ? '키움' : json['team'],
      owner: json['owner'],
      isPitcher: isPitcher,
    );
  }
}
