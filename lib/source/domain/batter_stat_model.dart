import 'package:abo/common/converter/datetime_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'batter_stat_model.freezed.dart';
part 'batter_stat_model.g.dart';

@Freezed()
class BatterStatModel with _$BatterStatModel {
  factory BatterStatModel({
    required int id,
    required double avg,
    required int game,
    required int hit,
    required int hr,
    required int bb,
    required double obp,
    required double ops,
    required double pa,
    required int rbi,
    required int sb,
    required double slg,
    required int so,
    required double war,
  }) = _BatterStatModel;

  factory BatterStatModel.fromJson(Map<String, dynamic> json) => _$BatterStatModelFromJson(json);
}

@Freezed()
class BatterDailyStatModel with _$BatterDailyStatModel {
  factory BatterDailyStatModel({
    required int id,
    required int playerId,
    @DateJsonConverter() required DateTime gameDate,
    required int atBat,
    required int hit,
    required int homeRun,
    required int rbi,
    required int runs,
    required int strikeout,
    required int walk,
    required double average,
    required double ops,
    required int re24,
  }) = _BatterDailyStatModel;

  factory BatterDailyStatModel.fromJson(Map<String, dynamic> json) => _$BatterDailyStatModelFromJson(json);
}
