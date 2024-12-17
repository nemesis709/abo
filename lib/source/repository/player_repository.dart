import 'package:abo/common/cache/simple_cache.dart';
import 'package:abo/common/data/result.dart';
import 'package:abo/common/service/iservice.dart';
import 'package:abo/common/service/main_service.dart';
import 'package:abo/source/domain/batter_stat_model.dart';
import 'package:abo/source/domain/lineup_model.dart';
import 'package:abo/source/domain/pitcher_stat_model.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/repository/api/apis.dart';
import 'package:abo/source/repository/auth_repository.dart';

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

  late final SimpleCache<List<PlayerModel>> _playerList;
  late final SimpleCache<List<PlayerModel>> _roasterList;

  late final SimpleCache<List<PlayerModel>> _pitcherList;
  late final SimpleCache<List<PlayerModel>> _batterList;

  Future<Result<List<PlayerModel>>> getPlayerList([bool? isPitcher]) async {
    return Result.guardFuture(() async {
      final result = await apis.playerApi.getPlayerList(isPitcher: isPitcher);

      return result.data;
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
        if (currentUser == null) {
          throw Error();
        } else {
          final players = await apis.playerApi.getRoaster(userId: currentUser.uid);
          return players.data;
        }
      });
    });
  }

  Future<Result<LineupModel>> getLineUp() async {
    return Result.guardFuture(() async {
      final currentUser = await AuthRepository.instance.getCurrentUser();
      if (currentUser == null) {
        throw Error();
      } else {
        final result = await apis.playerApi.getLineUp(userId: currentUser.uid);
        return result;
      }
    });
  }

  Future<Result<LineupModel>> setLineUp({
    required LineupModel lineupModel,
  }) async {
    return Result.guardFuture(() async {
      final currentUser = await AuthRepository.instance.getCurrentUser();
      if (currentUser == null) {
        throw Error();
      } else {
        final result = await apis.playerApi.setLineUp(userId: currentUser.uid, lineup: lineupModel);
        return result;
      }
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
