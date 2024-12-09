import 'package:abo/source/domain/collection_model.dart';
import 'package:abo/source/domain/game_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

part 'game_api.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class GameApi {
  factory GameApi(Dio dio) => _GameApi(dio);

  @POST('/game/schedule')
  Future<CollectionModel<GameModel>> getSchedule({
    @Body() required String dateTime,
  });
}

CollectionModel<GameModel> deserializeCollectionModelGameModel(Map<String, dynamic> json) =>
    CollectionModel<GameModel>.fromJson(json, (fromJsonT) => GameModel.fromJson(fromJsonT as Map<String, dynamic>));
