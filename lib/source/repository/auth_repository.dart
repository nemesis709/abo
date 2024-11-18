import 'package:abo/common/data/api_error.dart';
import 'package:abo/common/data/result.dart';
import 'package:abo/common/service/iservice.dart';
import 'package:abo/common/service/main_service.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:abo/source/repository/player_repository.dart';
import 'package:abo/source/repository/user_repository.dart';
import 'package:collection/collection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository implements IService {
  AuthRepository._privateConstructor() {
    MainService.instance.registerService(this);
  }

  static final AuthRepository _instance = AuthRepository._privateConstructor();

  static AuthRepository get instance => _instance;

  static SupabaseClient supabase = Supabase.instance.client;

  Future<UserModel?> currentUser() async {
    final currentUser = supabase.auth.currentUser;

    if (currentUser == null) {
      return null;
    }

    final userList = await supabase.from('users').select();
    final user = userList.firstWhereOrNull((e) => e['uid'] == currentUser.id);
    if (user == null) {
      return null;
    } else {
      return UserModel.fromJson(user);
    }
  }

  Future<Result<void>> signOut() async {
    return Result.guardFuture(() async {
      return await supabase.auth.signOut();
    });
  }

  Future<Result<void>> signIn(String email, String pw, bool persistence) async {
    return Result.guardFuture(() async {
      final result = await supabase.auth.signInWithPassword(
        email: email,
        password: pw,
      );

      if (result.user == null) {
        return Future.error(ApiError(AppErrorType.serverUnknown));
      } else {
        clearCache();

        return;
      }
    });
  }

  Future<Result<UserModel>> signUp(String email, String password, String name) async {
    return Result.guardFuture(() async {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'display_name': name, // 유저의 이름
        },
      );

      final user = response.user;

      if (user == null) {
        throw Exception('Failed to sign up: $response');
      }
      clearCache();
      final userList = await supabase.from('users').select();
      return UserModel.fromJson(userList.firstWhere((e) => e['uid'] == user.id));
    });
  }

  @override
  void clearCache() {
    PlayerRepository.instance.clearCache();
    UserRepository.instance.clearCache();
  }
}
