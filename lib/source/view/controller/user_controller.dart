import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:abo/source/service/player_service.dart';
import 'package:abo/source/service/user_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  @override
  FutureOr<List<UserModel>> build() async {
    return await getUserList();
  }

  Future<List<UserModel>> getUserList() async {
    final result = await UserService.instance.getUserList();
    return result.valueOrNull ?? [];
  }

}
