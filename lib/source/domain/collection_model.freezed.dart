// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CollectionModel<T> _$CollectionModelFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _CollectionModel<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$CollectionModel<T> {
  List<T> get data => throw _privateConstructorUsedError;

  /// Serializes this CollectionModel to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$CollectionModelImpl<T> implements _CollectionModel<T> {
  _$CollectionModelImpl({required final List<T> data}) : _data = data;

  factory _$CollectionModelImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$CollectionModelImplFromJson(json, fromJsonT);

  final List<T> _data;
  @override
  List<T> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'CollectionModel<$T>(data: $data)';
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$CollectionModelImplToJson<T>(this, toJsonT);
  }
}

abstract class _CollectionModel<T> implements CollectionModel<T> {
  factory _CollectionModel({required final List<T> data}) =
      _$CollectionModelImpl<T>;

  factory _CollectionModel.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$CollectionModelImpl<T>.fromJson;

  @override
  List<T> get data;
}
