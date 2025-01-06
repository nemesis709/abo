// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_update_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthUpdateModel _$AuthUpdateModelFromJson(Map<String, dynamic> json) {
  return _AuthUpdateModel.fromJson(json);
}

/// @nodoc
mixin _$AuthUpdateModel {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Serializes this AuthUpdateModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthUpdateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthUpdateModelCopyWith<AuthUpdateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthUpdateModelCopyWith<$Res> {
  factory $AuthUpdateModelCopyWith(
          AuthUpdateModel value, $Res Function(AuthUpdateModel) then) =
      _$AuthUpdateModelCopyWithImpl<$Res, AuthUpdateModel>;
  @useResult
  $Res call(
      {String accessToken, String refreshToken, String email, String password});
}

/// @nodoc
class _$AuthUpdateModelCopyWithImpl<$Res, $Val extends AuthUpdateModel>
    implements $AuthUpdateModelCopyWith<$Res> {
  _$AuthUpdateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthUpdateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthUpdateModelImplCopyWith<$Res>
    implements $AuthUpdateModelCopyWith<$Res> {
  factory _$$AuthUpdateModelImplCopyWith(_$AuthUpdateModelImpl value,
          $Res Function(_$AuthUpdateModelImpl) then) =
      __$$AuthUpdateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String accessToken, String refreshToken, String email, String password});
}

/// @nodoc
class __$$AuthUpdateModelImplCopyWithImpl<$Res>
    extends _$AuthUpdateModelCopyWithImpl<$Res, _$AuthUpdateModelImpl>
    implements _$$AuthUpdateModelImplCopyWith<$Res> {
  __$$AuthUpdateModelImplCopyWithImpl(
      _$AuthUpdateModelImpl _value, $Res Function(_$AuthUpdateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthUpdateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$AuthUpdateModelImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthUpdateModelImpl implements _AuthUpdateModel {
  const _$AuthUpdateModelImpl(
      {required this.accessToken,
      required this.refreshToken,
      required this.email,
      required this.password});

  factory _$AuthUpdateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthUpdateModelImplFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthUpdateModel(accessToken: $accessToken, refreshToken: $refreshToken, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthUpdateModelImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, refreshToken, email, password);

  /// Create a copy of AuthUpdateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthUpdateModelImplCopyWith<_$AuthUpdateModelImpl> get copyWith =>
      __$$AuthUpdateModelImplCopyWithImpl<_$AuthUpdateModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthUpdateModelImplToJson(
      this,
    );
  }
}

abstract class _AuthUpdateModel implements AuthUpdateModel {
  const factory _AuthUpdateModel(
      {required final String accessToken,
      required final String refreshToken,
      required final String email,
      required final String password}) = _$AuthUpdateModelImpl;

  factory _AuthUpdateModel.fromJson(Map<String, dynamic> json) =
      _$AuthUpdateModelImpl.fromJson;

  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  String get email;
  @override
  String get password;

  /// Create a copy of AuthUpdateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthUpdateModelImplCopyWith<_$AuthUpdateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
