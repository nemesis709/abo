import 'package:abo/common/converter/datetime_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pitcher_stat_model.freezed.dart';
part 'pitcher_stat_model.g.dart';

@Freezed()
class PitcherStatModel with _$PitcherStatModel {
  factory PitcherStatModel({
    required int id,
    required double bb9,
    required double era,
    required double fip,
    required int game,
    required int hold,
    required double inning,
    required double k9,
    required int lost,
    required int save,
    required double war,
    required int win,
  }) = _PitcherStatModel;

  factory PitcherStatModel.fromJson(Map<String, dynamic> json) => _$PitcherStatModelFromJson(json);
}

@Freezed()
class PitcherDailyStatModel with _$PitcherDailyStatModel {
  factory PitcherDailyStatModel({
    required int id,
    required int playerId,
    @DateJsonConverter() required DateTime gameDate,
    required double innings,
    required int hit,
    required int homeRun,
    required int earnedRus,
    required int strikeout,
    required int walk,
    required double whip,
    required double era,
    required int re24,
  }) = _PitcherDailyStatModel;

  factory PitcherDailyStatModel.fromJson(Map<String, dynamic> json) => _$PitcherDailyStatModelFromJson(json);
}
