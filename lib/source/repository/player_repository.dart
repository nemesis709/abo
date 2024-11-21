import 'package:abo/common/cache/simple_cache.dart';
import 'package:abo/common/data/result.dart';
import 'package:abo/common/service/iservice.dart';
import 'package:abo/source/domain/batter_stat_model.dart';
import 'package:abo/source/domain/pitcher_stat_model.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:abo/source/repository/auth_repository.dart';
import 'package:abo/source/repository/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PlayerRepository implements IService {
  PlayerRepository._privateConstructor() {
    _allPlayerList = SimpleCache<List<PlayerModel>>();
    _pitcherList = SimpleCache<List<PlayerModel>>();
    _batterList = SimpleCache<List<PlayerModel>>();
    _pitcherStatList = SimpleCache<List<PitcherStatModel>>();
    _batterStatList = SimpleCache<List<BatterStatModel>>();
  }

  static final PlayerRepository _instance = PlayerRepository._privateConstructor();

  static PlayerRepository get instance => _instance;

  static SupabaseClient supabase = Supabase.instance.client;

  late final SimpleCache<List<PlayerModel>> _allPlayerList;

  late final SimpleCache<List<PlayerModel>> _pitcherList;
  late final SimpleCache<List<PlayerModel>> _batterList;

  late final SimpleCache<List<PitcherStatModel>> _pitcherStatList;
  late final SimpleCache<List<BatterStatModel>> _batterStatList;

  Future<Result<List<PlayerModel>>> getAllPlayerList() async {
    return Result.guardFuture(() async {
      return await _allPlayerList.getAsync(create: () async {
        final players = await supabase.from('players').select();
        final users = await UserRepository.instance.getUserList();
        final userList = users.valueOrNull ?? <UserModel>[];
        return players.map((e) => PlayerModel.fromJson(e, userList)).toList();
      });
    });
  }

  Future<Result<List<PlayerModel>>> getPitcherList() async {
    return Result.guardFuture(() async {
      return await _pitcherList.getAsync(create: () async {
        return await _allPlayerList.getAsync(create: () async {
          final players = await supabase.from('players').select().eq('is_pitcher', true);
          final users = await UserRepository.instance.getUserList();
          final userList = users.valueOrNull ?? <UserModel>[];
          return players.map((e) => PlayerModel.fromJson(e, userList)).toList();
        });
      });
    });
  }

  Future<Result<PitcherStatModel>> getPitcherStat(PlayerModel playerModel) async {
    return Result.guardFuture(() async {
      final result = await _pitcherStatList.getAsync(create: () async {
        final list = <PitcherStatModel>[];
        //
        // final result = await fireStore.collection('player').doc('info').collection('pitcher_stat').get();
        //
        // final data = result.docs;
        //
        // for (var element in data) {
        //   list.add(PitcherStatModel.fromJson(element.data()));
        // }

        return list;
      });

      return result.firstWhere((element) => element.id == playerModel.id);
    });
  }

  Future<Result<List<PlayerModel>>> getBatterList() async {
    return Result.guardFuture(() async {
      final players = await supabase.from('players').select().eq('is_pitcher', false);
      final users = await UserRepository.instance.getUserList();
      final userList = users.valueOrNull ?? <UserModel>[];
      return players.map((e) => PlayerModel.fromJson(e, userList)).toList();
    });
  }

  Future<Result<BatterStatModel>> getBatterStat(PlayerModel playerModel) async {
    return Result.guardFuture(() async {
      final result = await _batterStatList.getAsync(create: () async {
        final list = <BatterStatModel>[];
        //
        // final result = await fireStore.collection('player').doc('info').collection('batter_stat').get();
        //
        // final data = result.docs;
        //
        // for (var element in data) {
        //   list.add(BatterStatModel.fromJson(element.data()));
        // }

        return list;
      });

      return result.firstWhere((element) => element.id == playerModel.id);
    });
  }

  Future<Result<List<PlayerModel>>> getRoaster() async {
    return Result.guardFuture(() async {
      return await _allPlayerList.getAsync(create: () async {
        final user = await AuthRepository.instance.currentUser();
        final players = await supabase.from('players').select().eq('user_id', user?.uid ?? '');
        final users = await UserRepository.instance.getUserList();
        final userList = users.valueOrNull ?? <UserModel>[];
        return players.map((e) => PlayerModel.fromJson(e, userList)).toList();
      });
    });
  }

  @override
  void clearCache() {
    _allPlayerList.clear();
    _pitcherList.clear();
    _batterList.clear();
    _pitcherStatList.clear();
    _batterStatList.clear();
  }
}
