import 'package:abo/app_common.dart';
import 'package:abo/common/data/api_error.dart';
import 'package:abo/source/domain/lineup_model.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/repository/player_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lineup_controller.g.dart';

@riverpod
class LineupController extends _$LineupController {
  @override
  FutureOr<LineupModel> build() async {
    return await getLineUp();
  }

  Future<void> updateLineup({
    required PlayerModel? player,
    required Position position,
  }) async {
    final lineup = state.requireValue;

    final newLineup = LineupModel(
      catcher: position == Position.catcher
          ? player
          : lineup.catcher == player
              ? null
              : lineup.catcher,
      firstBase: position == Position.firstBase
          ? player
          : lineup.firstBase == player
              ? null
              : lineup.firstBase,
      secondBase: position == Position.secondBase
          ? player
          : lineup.secondBase == player
              ? null
              : lineup.secondBase,
      thirdBase: position == Position.thirdBase
          ? player
          : lineup.thirdBase == player
              ? null
              : lineup.thirdBase,
      shortStop: position == Position.shortStop
          ? player
          : lineup.shortStop == player
              ? null
              : lineup.shortStop,
      leftField: position == Position.leftField
          ? player
          : lineup.leftField == player
              ? null
              : lineup.leftField,
      centerField: position == Position.centerField
          ? player
          : lineup.centerField == player
              ? null
              : lineup.centerField,
      rightField: position == Position.rightField
          ? player
          : lineup.rightField == player
              ? null
              : lineup.rightField,
      designated: position == Position.designated
          ? player
          : lineup.designated == player
              ? null
              : lineup.designated,
      startPitcher: lineup.startPitcher,
      reliefPitcher: lineup.reliefPitcher,
      closingPitcher: lineup.closingPitcher,
    );

    state = AsyncData(newLineup);
  }

  Future<void> updateStartPitcher({
    required PlayerModel? player,
  }) async {
    final lineup = state.requireValue;

    final newLineup = LineupModel(
      catcher: lineup.catcher,
      firstBase: lineup.firstBase,
      secondBase: lineup.secondBase,
      thirdBase: lineup.thirdBase,
      shortStop: lineup.shortStop,
      leftField: lineup.leftField,
      centerField: lineup.centerField,
      rightField: lineup.rightField,
      designated: lineup.designated,
      startPitcher: player,
      reliefPitcher: lineup.reliefPitcher == player ? null : lineup.reliefPitcher,
      closingPitcher: lineup.closingPitcher == player ? null : lineup.closingPitcher,
    );

    state = AsyncData(newLineup);
  }

  Future<void> updateReliefPitcher({
    required PlayerModel? player,
  }) async {
    final lineup = state.requireValue;

    final newLineup = LineupModel(
      catcher: lineup.catcher,
      firstBase: lineup.firstBase,
      secondBase: lineup.secondBase,
      thirdBase: lineup.thirdBase,
      shortStop: lineup.shortStop,
      leftField: lineup.leftField,
      centerField: lineup.centerField,
      rightField: lineup.rightField,
      designated: lineup.designated,
      startPitcher: lineup.startPitcher == player ? null : lineup.startPitcher,
      reliefPitcher: player,
      closingPitcher: lineup.closingPitcher == player ? null : lineup.closingPitcher,
    );

    state = AsyncData(newLineup);
  }

  Future<void> updateClosePitcher({
    required PlayerModel? player,
  }) async {
    final lineup = state.requireValue;

    final newLineup = LineupModel(
      catcher: lineup.catcher,
      firstBase: lineup.firstBase,
      secondBase: lineup.secondBase,
      thirdBase: lineup.thirdBase,
      shortStop: lineup.shortStop,
      leftField: lineup.leftField,
      centerField: lineup.centerField,
      rightField: lineup.rightField,
      designated: lineup.designated,
      startPitcher: lineup.startPitcher == player ? null : lineup.startPitcher,
      reliefPitcher: lineup.reliefPitcher == player ? null : lineup.reliefPitcher,
      closingPitcher: player,
    );

    state = AsyncData(newLineup);
  }

  Future<LineupModel> getLineUp() async {
    final result = await PlayerRepository.instance.getLineUp();
    return result.valueOrNull ?? LineupModel.empty();
  }

  Future<void> setLineUp() async {
    final lineupModel = state.requireValue;
    final result = await PlayerRepository.instance.setLineUp(lineupModel: lineupModel);

    result.when(success: (data) async {
      ref.showToast('라인업이 제출되었습니다');
      return;
    }, failure: (e, __) {
      e as ApiError;

      ref.showToast(e.getMessage());
      return;
    });

    ref.invalidateSelf();
  }
}
