import 'package:abo/common/logger/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RiverpodLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
      ProviderBase provider,
      Object? previousValue,
      Object? newValue,
      ProviderContainer container,
      ) {
    // logger.d('[RiverpodLogger] didUpdateProvider → ${provider.name ?? provider.runtimeType},  "newValue": "$newValue"');
    logger.d(
        '[RiverpodLogger] didUpdateProvider → ${provider.name ?? provider.runtimeType}(${identityHashCode(container)}/${identityHashCode(provider)})');
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    logger.d(
        '[RiverpodLogger] didDisposeProvider → ${provider.name ?? provider.runtimeType}(${identityHashCode(container)}/${identityHashCode(provider)})');
  }

  @override
  void didAddProvider(ProviderBase provider, Object? value, ProviderContainer container) {
    logger.d(
        '[RiverpodLogger] didAddProvider → ${provider.name ?? provider.runtimeType}(${identityHashCode(container)}/${identityHashCode(provider)})');
  }

  @override
  void providerDidFail(
      ProviderBase<Object?> provider, Object error, StackTrace stackTrace, ProviderContainer container) {
    logger.d(
        '[RiverpodLogger] providerDidFail → ${provider.name ?? provider.runtimeType}(${identityHashCode(container)}/${identityHashCode(provider)})');
  }
}
