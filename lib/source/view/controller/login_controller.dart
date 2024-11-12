import 'package:abo/app_common.dart';
import 'package:abo/common/data/api_error.dart';
import 'package:abo/common/logger/logger.dart';
import 'package:abo/source/repository/auth_repository.dart';
import 'package:abo/ui/route/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<User?> build() async {
    AuthRepository.instance.userState().listen((user) {
      if (user != null) {
        ref.route.replace(const HomeRoute());
      }
    });

    return await initAuth();
  }

  Future<User?> initAuth() async {
    final user = await AuthRepository.instance.currentUser();

    // if (user != null) {
    //   ref.route.replace(const HomeRoute());
    // }

    return user;
  }

  Future<bool> signIn(String email, String pw, bool persistent) async {
    final credential = await ref.runInProgress(() async {
      return AuthRepository.instance.signIn(email, pw, persistent);
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
      return AuthRepository.instance.signUp(email, pw, name);
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
