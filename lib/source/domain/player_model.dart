import 'package:abo/source/domain/batter_stat_model.dart';
import 'package:abo/source/domain/pitcher_stat_model.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_model.freezed.dart';
part 'player_model.g.dart';

@Freezed()
class PlayerModel with _$PlayerModel {
  factory PlayerModel({
    required int id,
    required String name,
    UserModel? owner,
    required int teamId,
    required String position,
    required DateTime birthDate,
    required String hand,
    required bool isPitcher,
    bool? onTrade,
    int? point,
    BatterStatModel? batterStatModel,
    BatterDailyStatModel? batterDailyStatModel,
    PitcherStatModel? pitcherStatModel,
    PitcherDailyStatModel? pitcherDailyStatModel,
  }) = _PlayerModel;

  factory PlayerModel.fromJson(Map<String, dynamic> json) => _$PlayerModelFromJson(json);
}
