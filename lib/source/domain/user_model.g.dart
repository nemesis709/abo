// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      uid: json['uid'] as String,
      name: json['name'] as String,
      game: (json['game'] as num).toInt(),
      win: (json['win'] as num).toInt(),
      draw: (json['draw'] as num).toInt(),
      lose: (json['lose'] as num).toInt(),
      point: (json['point'] as num).toInt(),
      rate: (json['rate'] as num).toDouble(),
      serverKey: (json['serverKey'] as num?)?.toInt(),
      teamKey: (json['teamKey'] as num?)?.toInt(),
      managerKey: (json['managerKey'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'game': instance.game,
      'win': instance.win,
      'draw': instance.draw,
      'lose': instance.lose,
      'point': instance.point,
      'rate': instance.rate,
      'serverKey': instance.serverKey,
      'teamKey': instance.teamKey,
      'managerKey': instance.managerKey,
    };
