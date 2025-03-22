
import 'package:abo/common/data/api_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'result.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T> {
  const Result._();

  const factory Result.success({required T data}) = ResultSuccess<T>;

  const factory Result.failure({required Object error, StackTrace? stackTrace}) = ResultFailure<T>;

  static Result<T> guard<T>(
    T Function() body, {
    Result<T> Function(Object exception)? error,
  }) {
    try {
      return Result.success(data: body());
    } on Exception catch (e, stack) {
      if (error != null) {
        return error(ApiError(e));
      }
      return Result.failure(error: ApiError(e), stackTrace: stack);
    }
  }

  static Future<Result<T>> guardFuture<T>(
    Future<T> Function() future, {
    Result<T> Function(ApiError exception)? error,
  }) async {
    try {
      return Result.success(data: await future());
    } catch (e, stack) {
      if (error != null) {
        return error(ApiError(e));
      }
      return Result.failure(error: ApiError(e), stackTrace: stack);
    }
  }

  @Deprecated('[guardFuture] 와 [toAsyncValue] 확장 메서드를 사용')
  static Future<AsyncValue<T>> guardAsyncValue<T>(Future<T> Function() future) async {
    try {
      return AsyncValue.data(await future());
    } catch (err, stack) {
      return AsyncValue.error(ApiError(err), stack);
    }
  }

  bool get isSuccess => when(success: (data) => true, failure: (e, stack) => false);

  bool get isFailure => !isSuccess;

  bool get hasError => isFailure;

  Object? get error => isFailure
      ? maybeWhen(
          failure: (e, stack) => e,
          orElse: () => null,
        )
      : null;

  ApiError? get apiError => isFailure
      ? maybeWhen(
          failure: (e, stack) => e is ApiError ? e : null,
          orElse: () => null,
        )
      : null;

  StackTrace? get stackTrace => isFailure
      ? maybeWhen(
          failure: (e, stack) => stack,
          orElse: () => null,
        )
      : null;

  void ifSuccess(Function(T data) body) {
    maybeWhen(
      success: (data) => body(data),
      orElse: () {
        // no-op
      },
    );
  }

  void ifFailure(Function(Object e) body) {
    maybeWhen(
      failure: (e, stack) => body(e),
      orElse: () {
        // no-op
      },
    );
  }

  T? get valueOrNull {
    return maybeWhen(
      success: (data) => data,
      orElse: () => null,
    );
  }

  // 오류가 있는 경우 오류를 throw 한다.
  T get requireValue {
    return when(
      success: (data) => data,
      failure: (e, stack) => throw e,
    );
  }
}