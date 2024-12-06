import 'package:abo/common/converter/datetime_converter.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_model.freezed.dart';
part 'game_model.g.dart';

@Freezed()
class GameModel with _$GameModel {
  factory GameModel({
    required String gameId,
    required DateTime gameDate,
    required UserModel homeUser,
    required UserModel awayUser,
  }) = _GameModel;

  factory GameModel.fromJson(Map<String, dynamic> json) => _$GameModelFromJson(json);
}
