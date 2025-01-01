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

  List<PlayerModel> getPlayerRank([int? length]) {
    final targetLength = length ?? 10;
    final players = List<PlayerModel>.from(state.value ?? []);
    return (players..sort((a, b) => (b.point ?? 0).compareTo(a.point ?? 0))) // point 기준 내림차순 정렬
        .sublist(0, players.length < targetLength ? players.length : targetLength) // 상위 10명 또는 최대 길이
        .toList();
  }
}
