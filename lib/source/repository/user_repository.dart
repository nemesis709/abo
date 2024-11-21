import 'package:abo/common/cache/simple_cache.dart';
import 'package:abo/common/data/result.dart';
import 'package:abo/common/extension/datetime_extension.dart';
import 'package:abo/common/logger/logger.dart';
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

      try {
        // Step 1: `players` 테이블에서 조건에 맞는 player_id 리스트 가져오기
        final playersResponse = await supabase.from('players').select('id').eq('user_id', userList[0].uid);

        // Extract player IDs into a list
        final playerIds = (playersResponse as List).map((player) => player['id']).toList();

        // Step 2: `daily_stats_batter`에서 game_date와 player_id 조건으로 데이터 가져오기
        final statsResponse = await supabase
            .from('daily_stats_batter')
            .select()
            .eq('game_date', date)
            .or(playerIds.map((id) => 'player_id.eq.$id').join(','));

        // 결과 출력
        final statsData = statsResponse;
        logger.d('Filtered Data: $statsData');
      } catch (e) {
        logger.d('Error: $e');
      }

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
