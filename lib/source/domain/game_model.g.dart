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
      canceled: json['canceled'] as bool?,
    );

Map<String, dynamic> _$$GameModelImplToJson(_$GameModelImpl instance) =>
    <String, dynamic>{
      'gameId': instance.gameId,
      'datetime': const DateJsonConverter().toJson(instance.datetime),
      'home': instance.home,
      'away': instance.away,
      'canceled': instance.canceled,
    };

_$GameInfoModelImpl _$$GameInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$GameInfoModelImpl(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      manager: ManagerModel.fromJson(json['manager'] as Map<String, dynamic>),
      score: (json['score'] as num?)?.toInt(),
      lineup: LineupModel.fromJson(json['lineup'] as Map<String, dynamic>),
      bench: (json['bench'] as List<dynamic>)
          .map((e) => PlayerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GameInfoModelImplToJson(_$GameInfoModelImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'manager': instance.manager,
      'score': instance.score,
      'lineup': instance.lineup,
      'bench': instance.bench,
    };
