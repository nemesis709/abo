class PlayerInfo {
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

  PlayerInfo({
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

  static PlayerInfo fromJson(Map json) {
    return PlayerInfo(
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
    );
  }
}
