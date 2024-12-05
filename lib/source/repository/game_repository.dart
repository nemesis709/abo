import 'package:abo/common/data/result.dart';
import 'package:abo/common/extension/datetime_extension.dart';
import 'package:abo/common/logger/logger.dart';
import 'package:abo/common/service/iservice.dart';
import 'package:abo/common/service/main_service.dart';
import 'package:abo/source/domain/game_model.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/repository/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GameRepository implements IService {
  GameRepository._privateConstructor() {
    MainService.instance.registerService(this);
  }

  static final GameRepository _instance = GameRepository._privateConstructor();

  static GameRepository get instance => _instance;

  static SupabaseClient supabase = Supabase.instance.client;

  Future<Result<List<GameModel>>> getSchedule(DateTime date) async {
    return Result.guardFuture(() async {
      final userList = await AuthRepository.instance.getUserList();

      final schedule = await supabase.from('schedule').select('''
    id,
    game_date,
    game_order,
    home_team_id,
    away_team_id
  ''').eq('game_date', date.toServerDate());

      await getGameData(date);
      return (schedule).map((e) => GameModel.fromJson(e, userList)).toList();
    });
  }

  Future<void> getGameData(DateTime date) async {
    final userList = await AuthRepository.instance.getUserList();
    final playersResponse = await supabase.from('players').select().eq('user_id', userList[0].uid);
    // logger.d(playersResponse);
    final players = playersResponse.map((e) => PlayerModel.fromJson(e, userList)).toList();

    // logger.d(players);

    // Step 2: `daily_stats_batter`에서 game_date와 player_id 조건으로 데이터 가져오기
    final batterStat = await supabase
        .from('daily_stats_batter')
        .select()
        .eq('game_date', date)
        .or(players.map((player) => 'player_id.eq.${player.id}').join(','));

    final pitcherStat = await supabase
        .from('daily_stats_pitcher')
        .select()
        .eq('game_date', date)
        .or(players.map((player) => 'player_id.eq.${player.id}').join(','));

    // 결과 출력
    logger.d('Filtered Data: $batterStat');
    // logger.d('Filtered Data: $pitcherStat');
  }

  @override
  void clearCache() {}
}
