import 'package:freezed_annotation/freezed_annotation.dart';

part 'manager_model.freezed.dart';
part 'manager_model.g.dart';

@Freezed()
class ManagerModel with _$ManagerModel {
  factory ManagerModel({
    required int id,
    required String name,
    String? imageUrl,
    required String description, // 감독 설명
    required String ability, // 감독 능력
    required int hit,
    required int twoBase,
    required int threeBase,
    required int homeRun,
    required int runsBattedIn,
    required int plateAppearance,
    required int runs,
    required int strikeout,
    required int walk,
    required int stealBase,
    required int stealFailed,
    required int error,
    required int innings,
    required int pHit,
    required int pHomerun,
    required int pEarnedRuns,
    required int pStrikeout,
    required int pWalk,
    required bool isSpecial,
  }) = _ManagerModel;

  factory ManagerModel.fromJson(Map<String, dynamic> json) =>
      _$ManagerModelFromJson(json);
}
