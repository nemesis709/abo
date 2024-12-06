// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pitcher_stat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PitcherStatModelImpl _$$PitcherStatModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PitcherStatModelImpl(
      id: json['id'] as String,
      bb9: (json['bb9'] as num).toDouble(),
      era: (json['era'] as num).toDouble(),
      fip: (json['fip'] as num).toDouble(),
      game: (json['game'] as num).toInt(),
      hold: (json['hold'] as num).toInt(),
      inning: (json['inning'] as num).toDouble(),
      k9: (json['k9'] as num).toDouble(),
      lost: (json['lost'] as num).toInt(),
      save: (json['save'] as num).toInt(),
      war: (json['war'] as num).toDouble(),
      win: (json['win'] as num).toInt(),
    );

Map<String, dynamic> _$$PitcherStatModelImplToJson(
        _$PitcherStatModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bb9': instance.bb9,
      'era': instance.era,
      'fip': instance.fip,
      'game': instance.game,
      'hold': instance.hold,
      'inning': instance.inning,
      'k9': instance.k9,
      'lost': instance.lost,
      'save': instance.save,
      'war': instance.war,
      'win': instance.win,
    };
