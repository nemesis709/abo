import 'package:abo/app_common.dart';
import 'package:abo/common/data/api_error.dart';
import 'package:abo/common/logger/logger.dart';
import 'package:abo/source/service/auth_service.dart';
import 'package:abo/ui/route/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_controller.g.dart';

@riverpod
class Settings extends _$Settings {
  @override
  FutureOr<FirebaseAuth> build() async {
    return FirebaseAuth.instance;
  }

  Future<bool> signOut() async {
    final credential = await ref.runInProgress(() async {
      return RecordMeasurementService.instance.signOut();
    });

    return credential.when(success: (data) {
      logger.d(credential);

      // data.user?.displayName
      ref.showToast('로그아웃이 완료되었습니다');

      ref.route.replace(const SignInRoute());
      return true;
    }, failure: (e, __) {
      e as ApiError;

      ref.showToast(e.message);
      return false;
    });
  }
}
