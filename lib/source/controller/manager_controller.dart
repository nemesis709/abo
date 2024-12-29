import 'package:abo/app_common.dart';
import 'package:abo/common/data/api_error.dart';
import 'package:abo/source/domain/manager_model.dart';
import 'package:abo/source/repository/player_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'manager_controller.g.dart';

@riverpod
class ManagerController extends _$ManagerController {
  ManagerModel? _managerModel;
  get manager => _managerModel;

  @override
  FutureOr<ManagerModel> build() async {
    return await getManager();
  }

  Future<List<ManagerModel>> getManagerList() async {
    final result = await PlayerRepository.instance.getManagerList();
    return result.valueOrNull ?? <ManagerModel>[];
  }

  Future<ManagerModel> getManager() async {
    final result = await PlayerRepository.instance.getManager();
    _managerModel ??= result.valueOrNull;
    return result.requireValue;
  }

  Future<void> updateManager(ManagerModel manager) async {
    state = AsyncData(manager);
  }

  Future<void> resetManager() async {
    if (_managerModel != null) {
      state = AsyncData(_managerModel!);
    }
  }

  Future<void> setManager() async {
    final managerModel = state.requireValue;
    final result = await PlayerRepository.instance.setManager(manager: managerModel);

    result.when(success: (data) async {
      ref.showToast('감독이 변경되었습니다');
      return;
    }, failure: (e, __) {
      e as ApiError;

      ref.showToast(e.getMessage());
      return;
    });

    _managerModel = null;
    ref.invalidateSelf();
  }
}
