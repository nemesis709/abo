import 'package:abo/common/data/result.dart';
import 'package:abo/common/logger/logger.dart';
import 'package:abo/common/service/iservice.dart';
import 'package:abo/source/domain/player_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlayerService implements IService {
  PlayerService._privateConstructor() {}

  static final PlayerService _instance = PlayerService._privateConstructor();

  static PlayerService get instance => _instance;

  static FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<Result<List<PlayerInfo>>> getPitcher() async {
    return Result.guardFuture(() async {
      final result = await fireStore
          .collection('player')
          .doc('info')
          .collection('pitcher')
          .get();
      final data = result.docs;

      final list = <PlayerInfo>[];

      for (var element in data) {
        list.add(PlayerInfo.fromJson(element.data()));
      }

      return list;
    });
  }

  Future<Result<List<PlayerInfo>>> getBatter() async {
    return Result.guardFuture(() async {
      final result = await fireStore
          .collection('player')
          .doc('info')
          .collection('batter')
          .get();
      final data = result.docs;

      final list = <PlayerInfo>[];

      for (var element in data) {
        list.add(PlayerInfo.fromJson(element.data()));
      }

      return list;
    });
  }

  @override
  void clearCache() {}
}
