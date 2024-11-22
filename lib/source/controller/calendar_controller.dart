import 'dart:async';

import 'package:abo/source/domain/game_model.dart';
import 'package:abo/source/repository/game_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calendar_controller.g.dart';

@riverpod
class CalendarController extends _$CalendarController {
  @override
  FutureOr<List<GameModel>> build({
    required DateTime dateTime,
  }) async {
    return await getSchedule(dateTime);
  }

  Future<List<GameModel>> getSchedule(dateTime) async {
    final result = await GameRepository.instance.getSchedule(dateTime);
    return result.valueOrNull ?? [];
  }
}
