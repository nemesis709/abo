import 'package:abo/app_common.dart';
import 'package:abo/common/data/api_error.dart';
import 'package:abo/common/logger/logger.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:abo/source/repository/auth_repository.dart';
import 'package:abo/source/repository/user_repository.dart';
import 'package:collection/collection.dart';
import 'package:encrypt/encrypt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_controller.g.dart';

@riverpod
class SettingsController extends _$SettingsController {
  @override
  FutureOr<UserModel?> build() async {
    return await getUser();
  }

  Future<UserModel?> getUser() async {
    final user = await AuthRepository.instance.currentUser();

    final userList = await UserRepository.instance.getUserList();

    return userList.when(success: (data) {
      return data.firstWhereOrNull((e) => e.uid == user?.uid) ??
          UserModel(
            uid: user?.uid ?? '',
            email: user?.email ?? '',
            name: user?.displayName ?? '',
          );
    }, failure: (e, __) {
      return UserModel(
        uid: user?.uid ?? '',
        email: user?.email ?? '',
        name: user?.displayName ?? '',
      );
    });
  }

  Future<void> signOut() async {
    final credential = await ref.runInProgress(() async {
      return AuthRepository.instance.signOut();
    });

    credential.when(success: (data) {
      logger.d(credential);
      ref.showToast('로그아웃이 완료되었습니다');
      state = AsyncData(null);

      return true;
    }, failure: (e, __) {
      e as ApiError;

      ref.showToast(e.message);
      return false;
    });
  }
}
