import 'dart:io';

import 'package:abo/common/data/server_error.dart';
import 'package:abo/common/logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum AppErrorType {
  network,
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  notAcceptable,
  conflict,
  cancel,
  timeout,
  server,
  serverUnknown,
  unknown,
}

@immutable
class ApiError {
  late final String message;
  late final AppErrorType type;
  late final ServerError? serverError;

  ApiError(Object error) {
    if (error is DioException) {
      logger.d('[ApiError] ApiError(DioError): type is ${error.type}, message is ${error.message}');
      message = error.message ?? 'dio error';
      switch (error.type) {
        case DioExceptionType.unknown:
          if (error.error is SocketException) {
            // SocketException: Failed host lookup: '***'
            // (OS Error: No address associated with hostname, errno = 7)
            type = AppErrorType.network;
          } else {
            type = AppErrorType.unknown;
          }
          break;
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
          type = AppErrorType.timeout;
          break;
        case DioExceptionType.sendTimeout:
          type = AppErrorType.network;
          break;
        case DioExceptionType.badResponse:
          // TODO(api): need define more http status;
          switch (error.response?.statusCode) {
            case HttpStatus.badRequest: // 400
              type = AppErrorType.badRequest;
              break;
            case HttpStatus.unauthorized: // 401
              type = AppErrorType.unauthorized;
              break;
            case HttpStatus.forbidden: // 403
              type = AppErrorType.forbidden;
              break;
            case HttpStatus.notFound: // 404
              type = AppErrorType.notFound;
              break;
            case HttpStatus.notAcceptable: // 406
              type = AppErrorType.notAcceptable;
              break;
            case HttpStatus.conflict: // 409
              type = AppErrorType.conflict;
              break;
            case HttpStatus.internalServerError: // 500
            case HttpStatus.badGateway: // 502
            case HttpStatus.serviceUnavailable: // 503
            case HttpStatus.gatewayTimeout: // 504
              type = AppErrorType.server;
              break;
            default:
              type = AppErrorType.serverUnknown;
              break;
          }
          try {
            serverError = ServerError.fromJson(error.response?.data);
          } catch (e) {
            logger.e('AppError serverError parse error:$e');
            serverError = null;
          }
          break;
        case DioExceptionType.cancel:
          type = AppErrorType.cancel;
          break;
        default:
          type = AppErrorType.unknown;
      }

      if (error.type != DioErrorType.badResponse) {
        serverError = null;
      }
    } else {
      logger.d('AppError(UnKnown): $error');
      type = AppErrorType.unknown;
      message = '$error';
      serverError = null;
    }
  }

  /// 오류 메시지를 반환한다.
  String getMessage() {
    if (serverError != null) {
      return serverError!.message ?? '서비스 오류입니다. 다시 시도해보시고, 문제가 계속되면 관리자에게 도움을 요청하세요.'; // TODO 서버 기본 에러 메시지 정의
    }
    switch (type) {
      case AppErrorType.network:
        return '네트워크를 확인해주세요';
      case AppErrorType.cancel:
        return '요청이 취소되었습니다.';
      case AppErrorType.badRequest:
      case AppErrorType.unauthorized:
      case AppErrorType.forbidden:
      case AppErrorType.notFound:
      case AppErrorType.notAcceptable:
      case AppErrorType.conflict:
      case AppErrorType.timeout:
      case AppErrorType.server:
      case AppErrorType.serverUnknown:
        return '서비스 오류입니다. 다시 시도해보시고, 문제가 계속되면 관리자에게 도움을 요청하세요.';
      case AppErrorType.unknown:
        return message;
    }
  }

  @override
  String toString() {
    return getMessage();
  }

  @Deprecated('Use [Result.guardAsyncValue]')
  static Future<AsyncValue<T>> guard<T>(Future<T> Function() future) async {
    try {
      return AsyncValue.data(await future());
    } catch (err, stack) {
      return AsyncValue.error(ApiError(err), stack);
    }
  }
}