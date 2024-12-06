// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameModelImpl _$$GameModelImplFromJson(Map<String, dynamic> json) =>
    _$GameModelImpl(
      gameId: json['gameId'] as String,
      gameDate: DateTime.parse(json['gameDate'] as String),
      homeUser: UserModel.fromJson(json['homeUser'] as Map<String, dynamic>),
      awayUser: UserModel.fromJson(json['awayUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GameModelImplToJson(_$GameModelImpl instance) =>
    <String, dynamic>{
      'gameId': instance.gameId,
      'gameDate': instance.gameDate.toIso8601String(),
      'homeUser': instance.homeUser,
      'awayUser': instance.awayUser,
    };
