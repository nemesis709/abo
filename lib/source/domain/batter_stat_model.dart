import 'package:freezed_annotation/freezed_annotation.dart';

part 'batter_stat_model.freezed.dart';
part 'batter_stat_model.g.dart';

@Freezed()
class BatterStatModel with _$BatterStatModel {
  factory BatterStatModel({
    required String id,
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
