import 'package:abo/common/cache/simple_cache.dart';
import 'package:abo/common/data/result.dart';
import 'package:abo/common/extension/datetime_extension.dart';
import 'package:abo/common/service/iservice.dart';
import 'package:abo/source/domain/game_model.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepository implements IService {
  UserRepository._privateConstructor() {
    _userList = SimpleCache<List<UserModel>>();
  }

  static final UserRepository _instance = UserRepository._privateConstructor();

  static UserRepository get instance => _instance;

  static SupabaseClient supabase = Supabase.instance.client;

  late final SimpleCache<List<UserModel>> _userList;

  Future<Result<List<UserModel>>> getUserList() async {
    return Result.guardFuture(() async {
      return _userList.getAsync(create: () async {
        final userList = await supabase.from('users').select();

        return userList.map((e) => UserModel.fromJson(e)).toList();
      });
    });
  }

  Future<Result<List<GameModel>>> getSchedule(DateTime date) async {
    return Result.guardFuture(() async {
      final users = await supabase.from('users').select();
      final userList = users.map((e) => UserModel.fromJson(e)).toList();

      final schedule = await supabase.from('schedule').select('''
    id,
    game_date,
    game_order,
    home_team_id,
    away_team_id
  ''').eq('game_date', date.toServerDate());

      return (schedule).map((e) => GameModel.fromJson(e, userList)).toList();
    });
  }

  @override
  void clearCache() {
    _userList.clear();
  }
}
