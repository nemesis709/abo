// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameModel _$GameModelFromJson(Map<String, dynamic> json) {
  return _GameModel.fromJson(json);
}

/// @nodoc
mixin _$GameModel {
  int get gameId => throw _privateConstructorUsedError;
  @DateJsonConverter()
  DateTime get datetime => throw _privateConstructorUsedError;
  GameInfoModel get home => throw _privateConstructorUsedError;
  GameInfoModel get away => throw _privateConstructorUsedError;

  /// Serializes this GameModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameModelCopyWith<GameModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameModelCopyWith<$Res> {
  factory $GameModelCopyWith(GameModel value, $Res Function(GameModel) then) =
      _$GameModelCopyWithImpl<$Res, GameModel>;
  @useResult
  $Res call(
      {int gameId,
      @DateJsonConverter() DateTime datetime,
      GameInfoModel home,
      GameInfoModel away});

  $GameInfoModelCopyWith<$Res> get home;
  $GameInfoModelCopyWith<$Res> get away;
}

/// @nodoc
class _$GameModelCopyWithImpl<$Res, $Val extends GameModel>
    implements $GameModelCopyWith<$Res> {
  _$GameModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? datetime = null,
    Object? home = null,
    Object? away = null,
  }) {
    return _then(_value.copyWith(
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as int,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      home: null == home
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as GameInfoModel,
      away: null == away
          ? _value.away
          : away // ignore: cast_nullable_to_non_nullable
              as GameInfoModel,
    ) as $Val);
  }

  /// Create a copy of GameModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GameInfoModelCopyWith<$Res> get home {
    return $GameInfoModelCopyWith<$Res>(_value.home, (value) {
      return _then(_value.copyWith(home: value) as $Val);
    });
  }

  /// Create a copy of GameModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GameInfoModelCopyWith<$Res> get away {
    return $GameInfoModelCopyWith<$Res>(_value.away, (value) {
      return _then(_value.copyWith(away: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameModelImplCopyWith<$Res>
    implements $GameModelCopyWith<$Res> {
  factory _$$GameModelImplCopyWith(
          _$GameModelImpl value, $Res Function(_$GameModelImpl) then) =
      __$$GameModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int gameId,
      @DateJsonConverter() DateTime datetime,
      GameInfoModel home,
      GameInfoModel away});

  @override
  $GameInfoModelCopyWith<$Res> get home;
  @override
  $GameInfoModelCopyWith<$Res> get away;
}

/// @nodoc
class __$$GameModelImplCopyWithImpl<$Res>
    extends _$GameModelCopyWithImpl<$Res, _$GameModelImpl>
    implements _$$GameModelImplCopyWith<$Res> {
  __$$GameModelImplCopyWithImpl(
      _$GameModelImpl _value, $Res Function(_$GameModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? datetime = null,
    Object? home = null,
    Object? away = null,
  }) {
    return _then(_$GameModelImpl(
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as int,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      home: null == home
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as GameInfoModel,
      away: null == away
          ? _value.away
          : away // ignore: cast_nullable_to_non_nullable
              as GameInfoModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameModelImpl implements _GameModel {
  _$GameModelImpl(
      {required this.gameId,
      @DateJsonConverter() required this.datetime,
      required this.home,
      required this.away});

  factory _$GameModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameModelImplFromJson(json);

  @override
  final int gameId;
  @override
  @DateJsonConverter()
  final DateTime datetime;
  @override
  final GameInfoModel home;
  @override
  final GameInfoModel away;

  @override
  String toString() {
    return 'GameModel(gameId: $gameId, datetime: $datetime, home: $home, away: $away)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameModelImpl &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.home, home) || other.home == home) &&
            (identical(other.away, away) || other.away == away));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, gameId, datetime, home, away);

  /// Create a copy of GameModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameModelImplCopyWith<_$GameModelImpl> get copyWith =>
      __$$GameModelImplCopyWithImpl<_$GameModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameModelImplToJson(
      this,
    );
  }
}

abstract class _GameModel implements GameModel {
  factory _GameModel(
      {required final int gameId,
      @DateJsonConverter() required final DateTime datetime,
      required final GameInfoModel home,
      required final GameInfoModel away}) = _$GameModelImpl;

  factory _GameModel.fromJson(Map<String, dynamic> json) =
      _$GameModelImpl.fromJson;

  @override
  int get gameId;
  @override
  @DateJsonConverter()
  DateTime get datetime;
  @override
  GameInfoModel get home;
  @override
  GameInfoModel get away;

  /// Create a copy of GameModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameModelImplCopyWith<_$GameModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GameInfoModel _$GameInfoModelFromJson(Map<String, dynamic> json) {
  return _GameInfoModel.fromJson(json);
}

/// @nodoc
mixin _$GameInfoModel {
  UserModel get user => throw _privateConstructorUsedError;
  int? get score => throw _privateConstructorUsedError;
  List<PlayerModel> get players => throw _privateConstructorUsedError;

  /// Serializes this GameInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameInfoModelCopyWith<GameInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameInfoModelCopyWith<$Res> {
  factory $GameInfoModelCopyWith(
          GameInfoModel value, $Res Function(GameInfoModel) then) =
      _$GameInfoModelCopyWithImpl<$Res, GameInfoModel>;
  @useResult
  $Res call({UserModel user, int? score, List<PlayerModel> players});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$GameInfoModelCopyWithImpl<$Res, $Val extends GameInfoModel>
    implements $GameInfoModelCopyWith<$Res> {
  _$GameInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? score = freezed,
    Object? players = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<PlayerModel>,
    ) as $Val);
  }

  /// Create a copy of GameInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameInfoModelImplCopyWith<$Res>
    implements $GameInfoModelCopyWith<$Res> {
  factory _$$GameInfoModelImplCopyWith(
          _$GameInfoModelImpl value, $Res Function(_$GameInfoModelImpl) then) =
      __$$GameInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserModel user, int? score, List<PlayerModel> players});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$GameInfoModelImplCopyWithImpl<$Res>
    extends _$GameInfoModelCopyWithImpl<$Res, _$GameInfoModelImpl>
    implements _$$GameInfoModelImplCopyWith<$Res> {
  __$$GameInfoModelImplCopyWithImpl(
      _$GameInfoModelImpl _value, $Res Function(_$GameInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? score = freezed,
    Object? players = null,
  }) {
    return _then(_$GameInfoModelImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<PlayerModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameInfoModelImpl implements _GameInfoModel {
  _$GameInfoModelImpl(
      {required this.user,
      this.score,
      required final List<PlayerModel> players})
      : _players = players;

  factory _$GameInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameInfoModelImplFromJson(json);

  @override
  final UserModel user;
  @override
  final int? score;
  final List<PlayerModel> _players;
  @override
  List<PlayerModel> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  String toString() {
    return 'GameInfoModel(user: $user, score: $score, players: $players)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameInfoModelImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.score, score) || other.score == score) &&
            const DeepCollectionEquality().equals(other._players, _players));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, user, score, const DeepCollectionEquality().hash(_players));

  /// Create a copy of GameInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameInfoModelImplCopyWith<_$GameInfoModelImpl> get copyWith =>
      __$$GameInfoModelImplCopyWithImpl<_$GameInfoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameInfoModelImplToJson(
      this,
    );
  }
}

abstract class _GameInfoModel implements GameInfoModel {
  factory _GameInfoModel(
      {required final UserModel user,
      final int? score,
      required final List<PlayerModel> players}) = _$GameInfoModelImpl;

  factory _GameInfoModel.fromJson(Map<String, dynamic> json) =
      _$GameInfoModelImpl.fromJson;

  @override
  UserModel get user;
  @override
  int? get score;
  @override
  List<PlayerModel> get players;

  /// Create a copy of GameInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameInfoModelImplCopyWith<_$GameInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
