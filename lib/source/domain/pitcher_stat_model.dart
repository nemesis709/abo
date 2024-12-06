import 'package:freezed_annotation/freezed_annotation.dart';

part 'pitcher_stat_model.freezed.dart';
part 'pitcher_stat_model.g.dart';

@Freezed()
class PitcherStatModel with _$PitcherStatModel {
  factory PitcherStatModel({
    required String id,
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
