import 'package:abo/common/data/api_error.dart';
import 'package:abo/common/loading/loading_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class Loading {
  final bool isLoading;
  final String? message;

  const Loading({required this.isLoading, this.message});

  factory Loading.loading([String? message]) => Loading(isLoading: true, message: message);

  factory Loading.finish() => const Loading(isLoading: false);
}

/// TODO 로딩 progress 및 예외 처리에 대한 구조 고민

extension LoadingAutoDisposeAsyncNotifierEx<State> on AutoDisposeAsyncNotifier<State> {
  Future<AsyncValue<State>> runInProgress({required Future<State> Function() future, String? message}) async {
    if (ref.exists(loadingNotifierProvider) != true) {
      return await ApiError.guard(future);
    }
    try {
      ref.read(loadingNotifierProvider.notifier).loading(message);
      return await ApiError.guard(future);
    } finally {
      ref.read(loadingNotifierProvider.notifier).hide();
    }
  }
}

extension WidgetRefEx on WidgetRef {
  Future<T> runInProgress<T>({required Future<T> Function() future, String? message}) async {
    if (exists(loadingNotifierProvider) != true) {
      return (await ApiError.guard(future)).requireValue;
    }
    try {
      read(loadingNotifierProvider.notifier).loading(message);
      return (await ApiError.guard(future)).requireValue;
    } finally {
      read(loadingNotifierProvider.notifier).hide();
    }
  }

  Future<AsyncValue<T>> runInProgressAsyncValue<T>({required Future<T> Function() future, String? message}) async {
    if (exists(loadingNotifierProvider) != true) {
      return (await ApiError.guard(future));
    }
    try {
      read(loadingNotifierProvider.notifier).loading(message);
      return (await ApiError.guard(future));
    } finally {
      read(loadingNotifierProvider.notifier).hide();
    }
  }
}
