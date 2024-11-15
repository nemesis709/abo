import 'dart:async';

import 'package:abo/source/domain/user_model.dart';
import 'package:abo/source/repository/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calendar_controller.g.dart';

@riverpod
class CalendarController extends _$CalendarController {
  @override
  FutureOr<List<List<UserModel>>> build({
    required DateTime dateTime,
  }) async {
    return await getSchedule();
  }

  Future<List<List<UserModel>>> getSchedule() async {
    final calendar = <List<UserModel>>[];
    final result = await UserRepository.instance.getUserList();
    final users = result.valueOrNull ?? [];

    // 2개씩 묶기
    for (int i = 0; i < users.length; i += 2) {
      calendar.add(users.sublist(i, i + 2));
    }

    return calendar;
  }
}
