import 'package:abo/app_common.dart';
import 'package:abo/common/data/api_error.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:abo/source/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<UserModel?> build() async {
    // return await AuthRepository.instance.getCurrentUser();
    return null;
  }

  Future<bool> signIn(String email, String pw, bool persistent) async {
    final credential = await ref.runInProgress(() async {
      return AuthRepository.instance.signIn(email, pw, persistent);
    });

    return credential.when(success: (data) {
      ref.showToast('로그인이 완료되었습니다');
      return true;
    }, failure: (e, __) {
      e as ApiError;

      ref.showToast(e.getMessage());
      return false;
    });
  }

  signUp(String email, String pw, String name) async {
    final credential = await ref.runInProgress(() async {
      return AuthRepository.instance.signUp(email, pw, name);
    });

    return credential.when(success: (data) async {
      ref.showToast('회원가입이 완료되었습니다');
      return true;
    }, failure: (e, __) {
      e as ApiError;

      ref.showToast(e.getMessage());
      return false;
    });
  }
}
