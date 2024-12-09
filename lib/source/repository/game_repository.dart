import 'package:abo/common/data/result.dart';
import 'package:abo/common/service/iservice.dart';
import 'package:abo/common/service/main_service.dart';
import 'package:abo/source/domain/game_model.dart';
import 'package:abo/source/repository/api/apis.dart';

class GameRepository implements IService {
  GameRepository._privateConstructor() {
    MainService.instance.registerService(this);
  }

  static final GameRepository _instance = GameRepository._privateConstructor();

  static GameRepository get instance => _instance;

  Future<Result<List<GameModel>>> getSchedule(DateTime date) async {
    return Result.guardFuture(() async {
      final schedule = await apis.gameApi.getSchedule(dateTime: date.toIso8601String());

      return schedule.data;
    });
  }

  @override
  void clearCache() {}
}
