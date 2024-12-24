// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ManagerModelImpl _$$ManagerModelImplFromJson(Map<String, dynamic> json) =>
    _$ManagerModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String?,
      description: json['description'] as String,
      ability: json['ability'] as String,
      hit: (json['hit'] as num).toInt(),
      twoBase: (json['twoBase'] as num).toInt(),
      threeBase: (json['threeBase'] as num).toInt(),
      homeRun: (json['homeRun'] as num).toInt(),
      runsBattedIn: (json['runsBattedIn'] as num).toInt(),
      plateAppearance: (json['plateAppearance'] as num).toInt(),
      runs: (json['runs'] as num).toInt(),
      strikeout: (json['strikeout'] as num).toInt(),
      walk: (json['walk'] as num).toInt(),
      stealBase: (json['stealBase'] as num).toInt(),
      stealFailed: (json['stealFailed'] as num).toInt(),
      error: (json['error'] as num).toInt(),
      innings: (json['innings'] as num).toInt(),
      pHit: (json['pHit'] as num).toInt(),
      pHomerun: (json['pHomerun'] as num).toInt(),
      pEarnedRuns: (json['pEarnedRuns'] as num).toInt(),
      pStrikeout: (json['pStrikeout'] as num).toInt(),
      pWalk: (json['pWalk'] as num).toInt(),
      isSpecial: json['isSpecial'] as bool,
    );

Map<String, dynamic> _$$ManagerModelImplToJson(_$ManagerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'ability': instance.ability,
      'hit': instance.hit,
      'twoBase': instance.twoBase,
      'threeBase': instance.threeBase,
      'homeRun': instance.homeRun,
      'runsBattedIn': instance.runsBattedIn,
      'plateAppearance': instance.plateAppearance,
      'runs': instance.runs,
      'strikeout': instance.strikeout,
      'walk': instance.walk,
      'stealBase': instance.stealBase,
      'stealFailed': instance.stealFailed,
      'error': instance.error,
      'innings': instance.innings,
      'pHit': instance.pHit,
      'pHomerun': instance.pHomerun,
      'pEarnedRuns': instance.pEarnedRuns,
      'pStrikeout': instance.pStrikeout,
      'pWalk': instance.pWalk,
      'isSpecial': instance.isSpecial,
    };
