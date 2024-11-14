import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/repository/player_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'roaster_controller.g.dart';

@riverpod
class RoasterController extends _$RoasterController {
  @override
  FutureOr<List<PlayerModel>> build() async {
    return await getRoaster();
  }

  Future<List<PlayerModel>> getRoaster() async {
    final result = await PlayerRepository.instance.getRoaster();
    return result.valueOrNull ?? [];
  }
}
