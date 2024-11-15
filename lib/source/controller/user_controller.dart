import 'dart:async';

import 'package:abo/source/domain/user_model.dart';
import 'package:abo/source/repository/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  @override
  FutureOr<List<UserModel>> build() async {
    return await getUserList();
  }

  Future<List<UserModel>> getUserList() async {
    final result = await UserRepository.instance.getUserList();
    return result.valueOrNull ?? [];
  }
}
