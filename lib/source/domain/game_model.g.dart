// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameModelImpl _$$GameModelImplFromJson(Map<String, dynamic> json) =>
    _$GameModelImpl(
      gameId: (json['gameId'] as num).toInt(),
      datetime: const DateJsonConverter().fromJson(json['datetime'] as String),
      home: GameInfoModel.fromJson(json['home'] as Map<String, dynamic>),
      away: GameInfoModel.fromJson(json['away'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GameModelImplToJson(_$GameModelImpl instance) =>
    <String, dynamic>{
      'gameId': instance.gameId,
      'datetime': const DateJsonConverter().toJson(instance.datetime),
      'home': instance.home,
      'away': instance.away,
    };

_$GameInfoModelImpl _$$GameInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$GameInfoModelImpl(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      score: (json['score'] as num).toInt(),
      players: (json['players'] as List<dynamic>)
          .map((e) => PlayerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GameInfoModelImplToJson(_$GameInfoModelImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'score': instance.score,
      'players': instance.players,
    };
