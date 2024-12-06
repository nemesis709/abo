// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batter_stat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BatterStatModelImpl _$$BatterStatModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BatterStatModelImpl(
      id: json['id'] as String,
      avg: (json['avg'] as num).toDouble(),
      game: (json['game'] as num).toInt(),
      hit: (json['hit'] as num).toInt(),
      hr: (json['hr'] as num).toInt(),
      bb: (json['bb'] as num).toInt(),
      obp: (json['obp'] as num).toDouble(),
      ops: (json['ops'] as num).toDouble(),
      pa: (json['pa'] as num).toDouble(),
      rbi: (json['rbi'] as num).toInt(),
      sb: (json['sb'] as num).toInt(),
      slg: (json['slg'] as num).toDouble(),
      so: (json['so'] as num).toInt(),
      war: (json['war'] as num).toDouble(),
    );

Map<String, dynamic> _$$BatterStatModelImplToJson(
        _$BatterStatModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avg': instance.avg,
      'game': instance.game,
      'hit': instance.hit,
      'hr': instance.hr,
      'bb': instance.bb,
      'obp': instance.obp,
      'ops': instance.ops,
      'pa': instance.pa,
      'rbi': instance.rbi,
      'sb': instance.sb,
      'slg': instance.slg,
      'so': instance.so,
      'war': instance.war,
    };
