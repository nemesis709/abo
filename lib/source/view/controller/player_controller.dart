import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/service/player_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_controller.g.dart';

@riverpod
class PlayerController extends _$PlayerController {
  @override
  FutureOr<List<PlayerModel>> build(bool? isPitcher) async {
    if(isPitcher == true) {
      return await getPitcherList();
    }else if(isPitcher == false){
      return await getBatterList();
    }else{
      return await getAllPlayerList();
    }
  }

  Future<List<PlayerModel>> getPitcherList() async {
    final result = await PlayerService.instance.getPitcherList();
    return result.valueOrNull ?? [];
  }

  Future<List<PlayerModel>> getBatterList() async {
    final result = await PlayerService.instance.getBatterList();
    return result.valueOrNull ?? [];
  }

  Future<List<PlayerModel>> getAllPlayerList() async {
    final result = await PlayerService.instance.getAllPlayerList();
    return result.valueOrNull ?? [];
  }
}
