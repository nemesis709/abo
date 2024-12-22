// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lineup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LineupModelImpl _$$LineupModelImplFromJson(Map<String, dynamic> json) =>
    _$LineupModelImpl(
      catcher: json['catcher'] == null
          ? null
          : PlayerModel.fromJson(json['catcher'] as Map<String, dynamic>),
      firstBase: json['firstBase'] == null
          ? null
          : PlayerModel.fromJson(json['firstBase'] as Map<String, dynamic>),
      secondBase: json['secondBase'] == null
          ? null
          : PlayerModel.fromJson(json['secondBase'] as Map<String, dynamic>),
      thirdBase: json['thirdBase'] == null
          ? null
          : PlayerModel.fromJson(json['thirdBase'] as Map<String, dynamic>),
      shortStop: json['shortStop'] == null
          ? null
          : PlayerModel.fromJson(json['shortStop'] as Map<String, dynamic>),
      leftField: json['leftField'] == null
          ? null
          : PlayerModel.fromJson(json['leftField'] as Map<String, dynamic>),
      centerField: json['centerField'] == null
          ? null
          : PlayerModel.fromJson(json['centerField'] as Map<String, dynamic>),
      rightField: json['rightField'] == null
          ? null
          : PlayerModel.fromJson(json['rightField'] as Map<String, dynamic>),
      designated: json['designated'] == null
          ? null
          : PlayerModel.fromJson(json['designated'] as Map<String, dynamic>),
      startPitcher: json['startPitcher'] == null
          ? null
          : PlayerModel.fromJson(json['startPitcher'] as Map<String, dynamic>),
      reliefPitcher1: json['reliefPitcher1'] == null
          ? null
          : PlayerModel.fromJson(
              json['reliefPitcher1'] as Map<String, dynamic>),
      reliefPitcher2: json['reliefPitcher2'] == null
          ? null
          : PlayerModel.fromJson(
              json['reliefPitcher2'] as Map<String, dynamic>),
      setupPitcher: json['setupPitcher'] == null
          ? null
          : PlayerModel.fromJson(json['setupPitcher'] as Map<String, dynamic>),
      closingPitcher: json['closingPitcher'] == null
          ? null
          : PlayerModel.fromJson(
              json['closingPitcher'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LineupModelImplToJson(_$LineupModelImpl instance) =>
    <String, dynamic>{
      'catcher': instance.catcher,
      'firstBase': instance.firstBase,
      'secondBase': instance.secondBase,
      'thirdBase': instance.thirdBase,
      'shortStop': instance.shortStop,
      'leftField': instance.leftField,
      'centerField': instance.centerField,
      'rightField': instance.rightField,
      'designated': instance.designated,
      'startPitcher': instance.startPitcher,
      'reliefPitcher1': instance.reliefPitcher1,
      'reliefPitcher2': instance.reliefPitcher2,
      'setupPitcher': instance.setupPitcher,
      'closingPitcher': instance.closingPitcher,
    };
