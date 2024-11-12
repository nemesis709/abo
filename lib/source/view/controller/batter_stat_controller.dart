import 'package:abo/source/domain/batter_stat_model.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/repository/player_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'batter_stat_controller.g.dart';

@riverpod
class BatterStatController extends _$BatterStatController {
  @override
  FutureOr<BatterStatModel> build(PlayerModel playerModel) async {
    return await getStat(playerModel);
  }

  Future<BatterStatModel> getStat(PlayerModel playerModel) async {
    final result = await PlayerRepository.instance.getBatterStat(playerModel);
    return result.requireValue;
  }

}
