import 'package:abo/source/domain/player_info.dart';
import 'package:abo/source/service/player_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_controller.g.dart';

@riverpod
class PlayerController extends _$PlayerController {
  @override
  FutureOr<List<PlayerInfo>> build(bool isPitcher) async {
    if(isPitcher) {
      return await getPitcher();
    }else{
      return await getBatter();
    }
  }

  Future<List<PlayerInfo>> getPitcher() async {
    final result = await PlayerService.instance.getPitcher();
    return result.valueOrNull ?? [];
  }

  Future<List<PlayerInfo>> getBatter() async {
    final result = await PlayerService.instance.getBatter();
    return result.valueOrNull ?? [];
  }
}
