import 'package:abo/app_common.dart';
import 'package:abo/common/data/api_error.dart';
import 'package:abo/common/logger/logger.dart';
import 'package:abo/source/service/auth_service.dart';
import 'package:abo/ui/route/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<FirebaseAuth> build() async {
    await initAuth();
    if(state.valueOrNull?.currentUser != null){
      showKeyboard = true;
    }
    return FirebaseAuth.instance;
  }

  bool showKeyboard = false;

  Future<void> initAuth() async {
    final user = await RecordMeasurementService.instance.initUser();

    if (user != null) {
      ref.route.replace(const HomeRoute());
    }
  }

  Future<bool> signIn(String email, String pw, bool persistent) async {
    final credential = await ref.runInProgress(() async {
      return RecordMeasurementService.instance.signIn(email, pw, persistent);
    });

    return credential.when(success: (data) {
      logger.d(credential);

      // data.user?.displayName
      ref.showToast('로그인이 완료되었습니다');
      return true;
    }, failure: (e, __) {
      e as ApiError;

      ref.showToast(e.message);
      return false;
    });
  }

  signUp(String email, String pw, String name) async {
    final credential = await ref.runInProgress(() async {
      return RecordMeasurementService.instance.signUp(email, pw, name);
    });

    return credential.when(success: (data) {
      logger.d(credential);
      ref.showToast('회원가입이 완료되었습니다');
      return true;
    }, failure: (e, __) {
      e as ApiError;

      ref.showToast(e.message);
      return false;
    });
  }
}
