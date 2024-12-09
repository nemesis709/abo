import 'package:abo/source/domain/collection_model.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

part 'player_api.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class PlayerApi {
  factory PlayerApi(Dio dio) => _PlayerApi(dio);

  @POST('/player/roaster')
  Future<CollectionModel<PlayerModel>> getRoaster({
    @Body() required UserModel user,
  });

  @GET('/player/list')
  Future<CollectionModel<PlayerModel>> getPlayerList({
    @Query('isPitcher') bool? isPitcher,
  });
}

CollectionModel<PlayerModel> deserializeCollectionModelPlayerModel(Map<String, dynamic> json) =>
    CollectionModel<PlayerModel>.fromJson(json, (fromJsonT) => PlayerModel.fromJson(fromJsonT as Map<String, dynamic>));
