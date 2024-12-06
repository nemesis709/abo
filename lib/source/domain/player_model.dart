import 'package:abo/common/converter/datetime_converter.dart';
import 'package:abo/source/domain/team_model.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_model.freezed.dart';
part 'player_model.g.dart';

@Freezed()
class PlayerModel with _$PlayerModel {
  factory PlayerModel({
    required int id,
    required String name,
    required UserModel owner,
    required Team team,
    required String position,
    required DateTime birthDate,
    required String hand,
    required bool isPitcher,
    bool? onTrade,
    int? point,
  }) = _PlayerModel;

  factory PlayerModel.fromJson(Map<String, dynamic> json) => _$PlayerModelFromJson(json);
}
