import 'dart:convert';

import 'package:abo/common/logger/logger.dart';
import 'package:abo/source/domain/auth_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_api.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class AuthApi {
  factory AuthApi(Dio dio) => _AuthApi(dio);

  @POST('/auth/login')
  Future<AuthResponse> signIn({
    @Body() required AuthModel auth,
  });

  @GET('/auth/current')
  Future<User?> getCurrentUser();
}

AuthResponse deserializeAuthResponse(Map<String, dynamic> json) {
  return AuthResponse(
    session: Session.fromJson(json['session']),
    user: User.fromJson(json['user']),
  );
}

User? deserializeUser(Map<String, dynamic> json) {
  logger.d(json);

  return User.fromJson(json);
}
