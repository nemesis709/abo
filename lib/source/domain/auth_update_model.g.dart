// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthUpdateModelImpl _$$AuthUpdateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthUpdateModelImpl(
      token: json['token'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$AuthUpdateModelImplToJson(
        _$AuthUpdateModelImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'password': instance.password,
    };
