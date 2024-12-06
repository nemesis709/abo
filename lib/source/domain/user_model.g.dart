// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      uid: json['uid'] as String,
      teamKey: (json['teamKey'] as num).toInt(),
      name: json['name'] as String,
      game: (json['game'] as num).toInt(),
      win: (json['win'] as num).toInt(),
      draw: (json['draw'] as num).toInt(),
      lose: (json['lose'] as num).toInt(),
      point: (json['point'] as num).toInt(),
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'teamKey': instance.teamKey,
      'name': instance.name,
      'game': instance.game,
      'win': instance.win,
      'draw': instance.draw,
      'lose': instance.lose,
      'point': instance.point,
      'rate': instance.rate,
    };
