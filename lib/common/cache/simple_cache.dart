
import 'package:abo/common/cache/icache.dart';

class SimpleCache<T> implements ICache {
  T? _cached;

  Future<T> getAsync({required Future<T> Function() create, T Function()? fallback}) async {
    if (_cached != null) {
      return _cached!;
    }

    try {
      _cached = await create();
      return _cached!;
    } catch (exception) {
      if (fallback != null) {
        _cached = fallback();
        return _cached!;
      }

      rethrow;
    }
  }

  @override
  void clear() {
    _cached = null;
  }

  // ignore: unnecessary_getters_setters
  T? get value => _cached;

  set value(T? newCache) {
    _cached = newCache;
  }
}
