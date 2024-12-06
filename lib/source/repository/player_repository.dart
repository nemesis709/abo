import 'package:abo/common/cache/simple_cache.dart';
import 'package:abo/common/data/result.dart';
import 'package:abo/common/service/iservice.dart';
import 'package:abo/common/service/main_service.dart';
import 'package:abo/source/domain/batter_stat_model.dart';
import 'package:abo/source/domain/pitcher_stat_model.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/repository/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PlayerRepository implements IService {
  PlayerRepository._privateConstructor() {
    MainService.instance.registerService(this);
    _playerList = SimpleCache<List<PlayerModel>>();
    _roasterList = SimpleCache<List<PlayerModel>>();
    _pitcherList = SimpleCache<List<PlayerModel>>();
    _batterList = SimpleCache<List<PlayerModel>>();
  }

  static final PlayerRepository _instance = PlayerRepository._privateConstructor();

  static PlayerRepository get instance => _instance;

  static SupabaseClient supabase = Supabase.instance.client;

  late final SimpleCache<List<PlayerModel>> _playerList;
  late final SimpleCache<List<PlayerModel>> _roasterList;

  late final SimpleCache<List<PlayerModel>> _pitcherList;
  late final SimpleCache<List<PlayerModel>> _batterList;

  Future<Result<List<PlayerModel>>> getPlayerList([bool? isPitcher]) async {
    final userList = await AuthRepository.instance.getUserList();

    return Result.guardFuture(() async {
      if (isPitcher == true) {
        return await _pitcherList.getAsync(create: () async {
          final players = await supabase.from('players').select().eq('is_pitcher', true);
          return players.map((e) => PlayerModel.fromJson(e)).toList();
        });
      } else if (isPitcher == false) {
        return await _batterList.getAsync(create: () async {
          final players = await supabase.from('players').select().eq('is_pitcher', false);

          return players.map((e) => PlayerModel.fromJson(e)).toList();
        });
      } else {
        return await _playerList.getAsync(create: () async {
          final players = await supabase.from('players').select();
          return players.map((e) => PlayerModel.fromJson(e)).toList();
        });
      }
    });
  }

  Future<Result<PitcherStatModel>> getPitcherStat(PlayerModel playerModel) async {
    return Result.failure(error: Error());
  }

  Future<Result<BatterStatModel>> getBatterStat(PlayerModel playerModel) async {
    return Result.failure(error: Error());
  }

  Future<Result<List<PlayerModel>>> getRoaster() async {
    return Result.guardFuture(() async {
      return await _roasterList.getAsync(create: () async {
        final currentUser = await AuthRepository.instance.getCurrentUser();

        final players = await supabase.from('players').select().eq('user_id', currentUser!.uid);
        final userList = await AuthRepository.instance.getUserList();
        return players.map((e) => PlayerModel.fromJson(e)).toList();
      });
    });
  }

  @override
  void clearCache() {
    _playerList.clear();
    _roasterList.clear();
    _pitcherList.clear();
    _batterList.clear();
  }
}
