// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerModelImpl _$$PlayerModelImplFromJson(Map<String, dynamic> json) =>
    _$PlayerModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      owner: UserModel.fromJson(json['owner'] as Map<String, dynamic>),
      team: $enumDecode(_$TeamEnumMap, json['team']),
      position: json['position'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      hand: json['hand'] as String,
      isPitcher: json['isPitcher'] as bool,
      onTrade: json['onTrade'] as bool?,
      point: (json['point'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PlayerModelImplToJson(_$PlayerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'owner': instance.owner,
      'team': _$TeamEnumMap[instance.team]!,
      'position': instance.position,
      'birthDate': instance.birthDate.toIso8601String(),
      'hand': instance.hand,
      'isPitcher': instance.isPitcher,
      'onTrade': instance.onTrade,
      'point': instance.point,
    };

const _$TeamEnumMap = {
  Team.Kiwoom: 'Kiwoom',
  Team.Hanwha: 'Hanwha',
  Team.Lotte: 'Lotte',
  Team.Doosan: 'Doosan',
  Team.Samsung: 'Samsung',
  Team.LG: 'LG',
  Team.Kia: 'Kia',
  Team.KT: 'KT',
  Team.SSG: 'SSG',
  Team.NC: 'NC',
};
