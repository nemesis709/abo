import 'package:abo/common/data/api_error.dart';
import 'package:abo/common/data/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// AsyncValue 에 대한 확장 메서드를 제공한다.
extension AsyncValueExtensions<T> on AsyncValue<T> {
  /// error 를 ApiError 로 캐스팅하여 호출한다.
  R whenApiError<R>({
    required R Function(T data) data,
    required R Function(ApiError error) error,
  }) {
    if (hasError && !hasValue) {
      return error(this.error! as ApiError);
    }

    return data(requireValue);
  }
}

extension ResultExtensions<T> on Result<T> {
  AsyncValue<T> toAsyncValue() {
    try {
      return AsyncValue.data(requireValue);
    } catch (err, stack) {
      return AsyncValue.error(err, stack);
    }
  }
}
