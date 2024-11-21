import 'package:abo/common/converter/datetime_converter.dart';
import 'package:abo/source/domain/team_model.dart';
import 'package:abo/source/domain/user_model.dart';

class PlayerModel {
  final int id;
  final String name;
  final UserModel owner;
  final Team team;
  final String position;
  final DateTime birthDate;
  final String hand;
  final bool isPitcher;
  final bool? onTrade;
  final int? point;

  PlayerModel({
    required this.id,
    required this.name,
    required this.owner,
    required this.team,
    required this.position,
    required this.birthDate,
    required this.hand,
    required this.isPitcher,
    this.onTrade,
    this.point,
  });

  Map toJson() => {
        ['id']: id,
        ['name']: name,
        ['user_id']: owner.uid,
        ['team_id']: team.id,
        ['position']: position,
        ['birth_date']: birthDate,
        ['hand']: hand,
        ['is_pitcher']: isPitcher,
        ['on_trade']: onTrade,
      };

  static PlayerModel fromJson(Map json, List<UserModel> userList) {
    return PlayerModel(
      id: json['id'],
      name: json['name'],
      owner: userList.firstWhere((e) => e.uid == json['user_id']),
      team: Team.values.firstWhere((e) => e.id == json['team_id']),
      position: json['position'],
      birthDate: DateJsonConverter().fromJson(json['birth_date']),
      hand: json['hand'],
      isPitcher: json['is_pitcher'],
      onTrade: json['on_trade'],
    );
  }
}
