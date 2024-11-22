import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/repository/player_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_controller.g.dart';

@riverpod
class PlayerController extends _$PlayerController {
  @override
  FutureOr<List<PlayerModel>> build(bool? isPitcher) async {
    return await getPlayerList(isPitcher);
  }

  Future<List<PlayerModel>> getPlayerList(isPitcher) async {
    final result = await PlayerRepository.instance.getPlayerList(isPitcher);
    return result.valueOrNull ?? [];
  }
}
