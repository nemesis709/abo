// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthUpdateModelImpl _$$AuthUpdateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthUpdateModelImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$AuthUpdateModelImplToJson(
        _$AuthUpdateModelImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'email': instance.email,
      'password': instance.password,
    };
