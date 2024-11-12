// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServerErrorImpl _$$ServerErrorImplFromJson(Map<String, dynamic> json) =>
    _$ServerErrorImpl(
      status: (json['status'] as num).toInt(),
      message: json['message'] as String?,
      error: json['error'] as String,
      datetime:
          const DateTimeJsonConverter().fromJson(json['datetime'] as String),
    );

Map<String, dynamic> _$$ServerErrorImplToJson(_$ServerErrorImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'error': instance.error,
      'datetime': const DateTimeJsonConverter().toJson(instance.datetime),
    };
