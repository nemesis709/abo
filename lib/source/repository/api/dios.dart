import 'package:dio/dio.dart';

class Dios {
//region singleton
  Dios._privateConstructor() {
    _baseDio = _initBaseDio();
  }

  static final Dios _instance = Dios._privateConstructor();

  static Dios get instance => _instance;

//endregion

  late Dio _baseDio;

  /// 기본 api
  Dio get baseDio => _baseDio;

  Dio _initBaseDio() {
    var baseOptions = BaseOptions(
        baseUrl: 'https://13.53.200.234:5000',
        contentType: 'application/json',
        connectTimeout: const Duration(seconds: 3),
        receiveTimeout: const Duration(seconds: 10),
        headers: null);
    var dio = Dio(baseOptions);
    // dio.interceptors.add(_AuthInterceptor(dio));
    // trustBadCertificate(dio);
    return dio;
  }
  //
  // Dio _initFileDio() {
  //   var baseOptions = BaseOptions(
  //     connectTimeout: const Duration(seconds: 3),
  //     receiveTimeout: const Duration(seconds: 300),
  //   );
  //   var dio = Dio(baseOptions);
  //   dio.interceptors.add(HanaNetworkLogInterceptor());
  //   trustBadCertificate(dio);
  //   return dio;
  // }
  //
  // Dio _initEmrDio() {
  //   var baseOptions = BaseOptions(
  //     baseUrl: BuildConst.instance.emrUrl,
  //     contentType: 'application/json',
  //     connectTimeout: const Duration(seconds: 3),
  //     receiveTimeout: const Duration(seconds: 10),
  //     headers: baseHeader,
  //   );
  //   var dio = Dio(baseOptions);
  //   dio.interceptors.add(HanaNetworkLogInterceptor());
  //   dio.interceptors.add(_AuthInterceptor(dio, true));
  //   trustBadCertificate(dio);
  //   return dio;
  // }
  //
  // Dio trustBadCertificate(Dio dio) {
  //   if (!BuildConst.instance.isRelease()) {
  //     (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () => HttpClient()
  //       ..badCertificateCallback = (X509Certificate cert, String host, int port) => host.contains('cenacle.com');
  //   }
  //   return dio;
  // }
}

sealed class AuthError {}

class AuthErrorUnauthorized extends AuthError {}

class AuthErrorEmptyAuthToken extends AuthError {}

class AuthErrorAllTokenInvalid extends AuthError {}

/// 인증 정보 갱신을 위한 인터셉터
// class _AuthInterceptor extends QueuedInterceptor {
//   final Dio _dio;
//
//   final bool ignoreAuthError;
//
//   _AuthInterceptor(this._dio, [this.ignoreAuthError = false]);
//
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
//     // logger.d('[DIO] onRequest [${DateTime.now()}] ${options.uri.toString()}');
//     var authToken = await AuthService.instance.getAccessToken();
//
//     // 인증 토큰이 없는 경우
//     if (authToken.isEmptySpace) {
//       return handler.reject(DioException(requestOptions: options, error: AuthErrorEmptyAuthToken()));
//     }
//
//     // 인증 토큰이 유효한 경우
//     if (await AuthService.instance.isValidAccessToken()) {
//       addCommonHeader(headers: options.headers, accessToken: authToken!);
//       return handler.next(options);
//     }
//
//     // 인증 토큰은 만료되었으나, Refresh 토큰이 유효한 경우
//     if (await AuthService.instance.isValidRefreshToken()) {
//       var authToken = await AuthService.instance.updateAccessTokenWithRefreshToken();
//       if (authToken != null) {
//         addCommonHeader(headers: options.headers, accessToken: authToken);
//         return handler.next(options);
//       }
//       return handler.reject(DioException(requestOptions: options, error: AuthErrorAllTokenInvalid()));
//     }
//
//     /// 비회원인 경우
//     /// 별도의 refresh token 이 없으므로, 인증토큰을 재발급 한다.
//     if (!AuthService.instance.isMember) {
//       var result = await AuthService.instance.createAccessTokenNonMember();
//       if (!result.hasError && AuthService.instance.accessToken != null) {
//         addCommonHeader(headers: options.headers, accessToken: AuthService.instance.accessToken!);
//         return handler.next(options);
//       }
//     }
//
//     // 인증 토큰과 refresh 토큰이 모두 유효하지 않거나, 토큰 갱신에 실패한 경우
//     return handler.reject(DioException(requestOptions: options, error: AuthErrorAllTokenInvalid()));
//   }
//
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     // logger.d('[DIO] onResponse [${DateTime.now()}] ${response.requestOptions.uri.toString()}');
//     super.onResponse(response, handler);
//   }
//
//   @override
//   void onError(DioException error, ErrorInterceptorHandler handler) async {
//     if (ignoreAuthError || error.response?.statusCode != 401) {
//       if (error.response?.statusCode == 403) {
//         final apiError = ApiError(error);
//
//         /// 타겟 유저 권한이 없는 경우 사용자 정보를 갱신요청한다.
//         if (apiError.serverError?.errorCode == 'no_permission_to_target_user') {
//           eventBus.fire(UserInfoChangedEvent(null));
//         }
//       }
//       super.onError(error, handler);
//       return;
//     }
//
//     /// 인증이 풀리는 경우 별도 에러를 보여주지 않는다.
//     final isLoggingOut = AuthService.instance.isLoggingOut;
//     AuthService.instance.isLoggingOut = true;
//     logger.d('[LogoutRequest] auth error. url:${error.requestOptions.uri}');
//
//     final apiError = ApiError(error);
//     if (apiError.serverError?.errorCode == 'logged_in_with_different_device') {
//       if (isLoggingOut != true) {
//         logger.d('[LogoutRequest] fire LogoutRequestEvent');
//         eventBus.fire(LogoutRequestEvent(LogoutType.loggedInWithDifferentDevice));
//       }
//     } else {
//       await AuthService.instance.requestLogout(LogoutType.unauthorized);
//     }
//     return handler.reject(DioException(requestOptions: error.requestOptions, error: AuthErrorUnauthorized()));
//   }
//
//   void addCommonHeader({required Map<String, dynamic> headers, required String accessToken}) {
//     headers.addAll(Dios.instance.baseHeader);
//     headers['Authorization'] = 'Bearer $accessToken';
//     if (AuthService.instance.userId != null) {
//       headers['cenacle-user-id'] = AuthService.instance.userId;
//       if (!headers.containsKey('cenacle-target-user-id')) {
//         headers['cenacle-target-user-id'] = AuthService.instance.userId;
//       }
//     }
//   }
// }
