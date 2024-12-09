import 'package:abo/source/domain/auth_model.dart';
import 'package:abo/source/domain/collection_model.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class AuthApi {
  factory AuthApi(Dio dio) => _AuthApi(dio);

  @POST('/auth/signup')
  Future<UserModel> signUp({
    @Body() required AuthModel auth,
  });

  @POST('/auth/signin')
  Future<UserModel> signIn({
    @Body() required AuthModel auth,
  });

  @GET('/auth/signout')
  Future<void> signOut();

  @GET('/auth/users')
  Future<CollectionModel<UserModel>> getUserList();
}

UserModel deserializeUserModel(Map<String, dynamic> json) => UserModel.fromJson(json);

CollectionModel<UserModel> deserializeCollectionModelUserModel(Map<String, dynamic> json) =>
    CollectionModel<UserModel>.fromJson(json, (fromJsonT) => UserModel.fromJson(fromJsonT as Map<String, dynamic>));
