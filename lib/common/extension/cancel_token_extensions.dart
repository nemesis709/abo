import 'dart:async';

import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension CancelTokenExtension on Ref {
  CancelToken cancelToken() {
    final cancelToken = CancelToken();
    onDispose(cancelToken.cancel);
    return cancelToken;
  }

  StreamSubscription eventSubscribe<T>(EventBus eventbus, void Function(T event) onData) {
    final subscription = eventbus.on<T>().listen(onData);
    onDispose(subscription.cancel);
    return subscription;
  }
}
