// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerModelImpl _$$PlayerModelImplFromJson(Map<String, dynamic> json) =>
    _$PlayerModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      owner: json['owner'] == null
          ? null
          : UserModel.fromJson(json['owner'] as Map<String, dynamic>),
      teamId: (json['teamId'] as num).toInt(),
      position: json['position'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      hand: json['hand'] as String,
      isPitcher: json['isPitcher'] as bool,
      onTrade: json['onTrade'] as bool?,
      point: (json['point'] as num?)?.toInt(),
      batterStatModel: json['batterStatModel'] == null
          ? null
          : BatterStatModel.fromJson(
              json['batterStatModel'] as Map<String, dynamic>),
      batterDailyStatModel: json['batterDailyStatModel'] == null
          ? null
          : BatterDailyStatModel.fromJson(
              json['batterDailyStatModel'] as Map<String, dynamic>),
      pitcherStatModel: json['pitcherStatModel'] == null
          ? null
          : PitcherStatModel.fromJson(
              json['pitcherStatModel'] as Map<String, dynamic>),
      pitcherDailyStatModel: json['pitcherDailyStatModel'] == null
          ? null
          : PitcherDailyStatModel.fromJson(
              json['pitcherDailyStatModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PlayerModelImplToJson(_$PlayerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'owner': instance.owner,
      'teamId': instance.teamId,
      'position': instance.position,
      'birthDate': instance.birthDate.toIso8601String(),
      'hand': instance.hand,
      'isPitcher': instance.isPitcher,
      'onTrade': instance.onTrade,
      'point': instance.point,
      'batterStatModel': instance.batterStatModel,
      'batterDailyStatModel': instance.batterDailyStatModel,
      'pitcherStatModel': instance.pitcherStatModel,
      'pitcherDailyStatModel': instance.pitcherDailyStatModel,
    };
