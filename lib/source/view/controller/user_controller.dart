import 'dart:async';

import 'package:abo/common/event/event_bus.dart';
import 'package:abo/common/event/profile_event.dart';
import 'package:abo/common/extension/cancel_token_extensions.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:abo/source/service/user_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  StreamSubscription? _changeEvent;

  @override
  FutureOr<List<UserModel>> build() async {
    _subscribeChangedEvent();
    return await getUserList();
  }


  /// 변경 이벤트를 구독한다.
  void _subscribeChangedEvent() {
    if (_changeEvent == null) {
      _changeEvent = ref.eventSubscribe<ProfileEvent>(eventBus, (event) async {
        ref.invalidateSelf();
      });
      ref.onDispose(() {
        _changeEvent = null;
      });
    }
  }


  Future<List<UserModel>> getUserList() async {
    final result = await UserService.instance.getUserList();
    return result.valueOrNull ?? [];
  }

}
