import 'package:abo/source/controller/settings_controller.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:abo/source/repository/player_repository.dart';
import 'package:abo/source/repository/user_repository.dart';
import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_controller.g.dart';

@riverpod
class PlayerController extends _$PlayerController {
  late List<UserModel> _userList;

  @override
  FutureOr<List<PlayerModel>> build(bool? isPitcher) async {
    await getUserList();

    if (isPitcher == true) {
      return await getPitcherList();
    } else if (isPitcher == false) {
      return await getBatterList();
    } else {
      return await getAllPlayerList();
    }
  }

  Future<List<PlayerModel>> getPitcherList() async {
    final result = await PlayerRepository.instance.getPitcherList();
    return result.valueOrNull ?? [];
  }

  Future<List<PlayerModel>> getBatterList() async {
    final result = await PlayerRepository.instance.getBatterList();
    return result.valueOrNull ?? [];
  }

  Future<List<PlayerModel>> getAllPlayerList() async {
    final result = await PlayerRepository.instance.getAllPlayerList();
    return result.valueOrNull ?? [];
  }

  Future<void> getUserList() async {
    final userList = await UserRepository.instance.getUserList();

    userList.when(success: (data) {
      _userList = data;
    }, failure: (e, _) {
      _userList = [];
    });
  }

  List<UserModel> get userList => _userList;
}
