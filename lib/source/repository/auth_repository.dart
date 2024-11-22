import 'package:abo/common/cache/simple_cache.dart';
import 'package:abo/common/data/api_error.dart';
import 'package:abo/common/data/result.dart';
import 'package:abo/common/service/iservice.dart';
import 'package:abo/common/service/main_service.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:abo/source/repository/player_repository.dart';
import 'package:abo/source/repository/game_repository.dart';
import 'package:collection/collection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// this repository only can be called from other repositories
class AuthRepository implements IService {
  AuthRepository._privateConstructor() {
    MainService.instance.registerService(this);
    _userList = SimpleCache<List<UserModel>>();
    _currentUser = SimpleCache<UserModel?>();
  }

  static final AuthRepository _instance = AuthRepository._privateConstructor();

  static AuthRepository get instance => _instance;

  static SupabaseClient supabase = Supabase.instance.client;

  late final SimpleCache<List<UserModel>> _userList;
  late final SimpleCache<UserModel?> _currentUser;

  Future<UserModel?> getCurrentUser() async {
    final result = await Result.guardFuture(() async {
      return _currentUser.getAsync(create: () async {
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
      });
    });

    return result.valueOrNull;
  }

  Future<Result<void>> signOut() async {
    return Result.guardFuture(() async {
      await supabase.auth.signOut();
      clearCache();
      return;
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

  Future<List<UserModel>> getUserList() async {
    final result = await Result.guardFuture(() async {
      return _userList.getAsync(create: () async {
        final userList = await supabase.from('users').select();

        return userList.map((e) => UserModel.fromJson(e)).toList();
      });
    });
    return result.valueOrNull ?? [];
  }

  @override
  void clearCache() {
    PlayerRepository.instance.clearCache();
    GameRepository.instance.clearCache();
    _currentUser.clear();
    _userList.clear();
  }
}
