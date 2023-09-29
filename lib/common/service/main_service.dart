

import 'package:abo/common/service/iservice.dart';

class MainService {
//region singleton
  MainService._privateConstructor() {
    _services = <IService>[];
  }

  static final MainService _instance = MainService._privateConstructor();

  static MainService get instance => _instance;

//endregion

  late final List<IService> _services;

  /// 서비스를 등록한다.
  void registerService(IService service) {
    if (!_services.contains(service)) {
      _services.add(service);
    }
  }

  /// 전체 캐시를 삭제한다.
  void clearAllCache() {
    for (var service in _services) {
      service.clearCache();
    }
  }
}
