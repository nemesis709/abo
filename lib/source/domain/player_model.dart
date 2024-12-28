import 'package:abo/common/converter/position_converter.dart';
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
    @PositionJsonConverter() required Position position,
    required DateTime birthDate,
    required String hand,
    required bool isPitcher,
    bool? onPosition,
    int? positionNumber,
    int? lineupNumber,
    bool? isForeigner,
    bool? onTrade,
    int? point,
    BatterStatModel? batterStatModel,
    BatterDailyStatModel? batterDailyStatModel,
    PitcherStatModel? pitcherStatModel,
    PitcherDailyStatModel? pitcherDailyStatModel,
  }) = _PlayerModel;

  factory PlayerModel.fromJson(Map<String, dynamic> json) => _$PlayerModelFromJson(json);
}

extension PlayerModelExtension on PlayerModel {
  int get dailyPoint => batterDailyStatModel?.point ?? pitcherDailyStatModel?.point ?? 0;
}

enum Position {
  pitcher('P', false),
  catcher('C', false),
  firstBase('1B', false),
  secondBase('2B', false),
  thirdBase('3B', false),
  shortStop('SS', false),
  leftField('LF', true),
  centerField('CF', true),
  rightField('RF', true),
  designated('DH', false);

  const Position(this.displayString, this.isOutfield);

  final String displayString;
  final bool isOutfield;
}

// Extension to compare based on custom logic
extension PositionEquality on Position {
  bool isEqual(Position other) {
    if (this == Position.designated) {
      return true;
    } else if (isOutfield) {
      return isOutfield == other.isOutfield;
    } else {
      return name == other.name;
    }
  }
}
