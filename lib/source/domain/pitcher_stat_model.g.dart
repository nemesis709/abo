// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pitcher_stat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PitcherStatModelImpl _$$PitcherStatModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PitcherStatModelImpl(
      id: (json['id'] as num).toInt(),
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

_$PitcherDailyStatModelImpl _$$PitcherDailyStatModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PitcherDailyStatModelImpl(
      id: (json['id'] as num).toInt(),
      playerId: (json['playerId'] as num).toInt(),
      gameDate: const DateJsonConverter().fromJson(json['gameDate'] as String),
      point: (json['point'] as num).toInt(),
      innings: (json['innings'] as num).toDouble(),
      hit: (json['hit'] as num).toInt(),
      homeRun: (json['homeRun'] as num).toInt(),
      earnedRus: (json['earnedRus'] as num).toInt(),
      strikeout: (json['strikeout'] as num).toInt(),
      walk: (json['walk'] as num).toInt(),
      whip: (json['whip'] as num).toDouble(),
      era: (json['era'] as num).toDouble(),
      re24: (json['re24'] as num).toInt(),
    );

Map<String, dynamic> _$$PitcherDailyStatModelImplToJson(
        _$PitcherDailyStatModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'playerId': instance.playerId,
      'gameDate': const DateJsonConverter().toJson(instance.gameDate),
      'point': instance.point,
      'innings': instance.innings,
      'hit': instance.hit,
      'homeRun': instance.homeRun,
      'earnedRus': instance.earnedRus,
      'strikeout': instance.strikeout,
      'walk': instance.walk,
      'whip': instance.whip,
      'era': instance.era,
      're24': instance.re24,
    };
