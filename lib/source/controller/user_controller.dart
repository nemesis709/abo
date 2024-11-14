import 'dart:async';

import 'package:abo/source/domain/user_model.dart';
import 'package:abo/source/repository/user_repository.dart';
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
    /// TODO login 이벤트 처리
    // if (_changeEvent == null) {
    //   _changeEvent = ref.eventSubscribe<ProfileEvent>(eventBus, (event) async {
    //     ref.invalidateSelf();
    //   });
    //   ref.onDispose(() {
    //     _changeEvent = null;
    //   });
    // }
  }


  Future<List<UserModel>> getUserList() async {
    final result = await UserRepository.instance.getUserList();
    return result.valueOrNull ?? [];
  }

}
