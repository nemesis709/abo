import 'package:abo/common/data/result.dart';
import 'package:abo/common/service/iservice.dart';
import 'package:abo/source/domain/batter_stat_model.dart';
import 'package:abo/source/domain/pitcher_stat_model.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlayerService implements IService {
  PlayerService._privateConstructor() {}

  static final PlayerService _instance = PlayerService._privateConstructor();

  static PlayerService get instance => _instance;

  static FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<Result<List<PlayerModel>>> getAllPlayerList() async {
    return Result.guardFuture(() async {
      final pitcher = await fireStore
          .collection('player')
          .doc('info')
          .collection('pitcher')
          .get();
      final pitcherData = pitcher.docs;

      final list = <PlayerModel>[];

      for (var element in pitcherData) {
        list.add(PlayerModel.fromJson(element.data(), true));
      }

      final batter = await fireStore
          .collection('player')
          .doc('info')
          .collection('batter')
          .get();
      final batterData = batter.docs;

      for (var element in batterData) {
        list.add(PlayerModel.fromJson(element.data(),false));
      }

      return list;
    });
  }


  Future<Result<List<PlayerModel>>> getPitcherList() async {
    return Result.guardFuture(() async {
      final result = await fireStore
          .collection('player')
          .doc('info')
          .collection('pitcher')
          .get();
      final data = result.docs;

      final list = <PlayerModel>[];

      for (var element in data) {
        list.add(PlayerModel.fromJson(element.data(), true));
      }

      return list;
    });
  }

  Future<Result<PitcherStatModel>> getPitcherStat(PlayerModel playerModel) async {
    return Result.guardFuture(() async {
      final result = await fireStore
          .collection('player')
          .doc('info')
          .collection('pitcher_stat')
          .where('id',isEqualTo: playerModel.id).get();

      final data =result.docs.first;
      return PitcherStatModel.fromJson(data.data());
    });
  }

  Future<Result<List<PlayerModel>>> getBatterList() async {
    return Result.guardFuture(() async {
      final result = await fireStore
          .collection('player')
          .doc('info')
          .collection('batter')
          .get();
      final data = result.docs;

      final list = <PlayerModel>[];

      for (var element in data) {
        list.add(PlayerModel.fromJson(element.data(), false));
      }

      return list;
    });
  }

  Future<Result<BatterStatModel>> getBatterStat(PlayerModel playerModel) async {
    return Result.guardFuture(() async {
      final result = await fireStore
          .collection('player')
          .doc('info')
          .collection('batter_stat')
          .where('id',isEqualTo: playerModel.id).get();

      final data =result.docs.first;

      return BatterStatModel.fromJson(data.data());
    });
  }

  @override
  void clearCache() {}
}
