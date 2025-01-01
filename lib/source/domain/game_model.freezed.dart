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
  bool? get canceled => throw _privateConstructorUsedError;

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
      GameInfoModel away,
      bool? canceled});

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
    Object? canceled = freezed,
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
      canceled: freezed == canceled
          ? _value.canceled
          : canceled // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      GameInfoModel away,
      bool? canceled});

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
    Object? canceled = freezed,
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
      canceled: freezed == canceled
          ? _value.canceled
          : canceled // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      required this.away,
      this.canceled});

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
  final bool? canceled;

  @override
  String toString() {
    return 'GameModel(gameId: $gameId, datetime: $datetime, home: $home, away: $away, canceled: $canceled)';
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
            (identical(other.away, away) || other.away == away) &&
            (identical(other.canceled, canceled) ||
                other.canceled == canceled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, gameId, datetime, home, away, canceled);

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
      required final GameInfoModel away,
      final bool? canceled}) = _$GameModelImpl;

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
  @override
  bool? get canceled;

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
  ManagerModel get manager => throw _privateConstructorUsedError;
  int? get score => throw _privateConstructorUsedError;
  LineupModel get lineup => throw _privateConstructorUsedError;
  List<PlayerModel> get bench => throw _privateConstructorUsedError;

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
  $Res call(
      {UserModel user,
      ManagerModel manager,
      int? score,
      LineupModel lineup,
      List<PlayerModel> bench});

  $UserModelCopyWith<$Res> get user;
  $ManagerModelCopyWith<$Res> get manager;
  $LineupModelCopyWith<$Res> get lineup;
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
    Object? manager = null,
    Object? score = freezed,
    Object? lineup = null,
    Object? bench = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      manager: null == manager
          ? _value.manager
          : manager // ignore: cast_nullable_to_non_nullable
              as ManagerModel,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      lineup: null == lineup
          ? _value.lineup
          : lineup // ignore: cast_nullable_to_non_nullable
              as LineupModel,
      bench: null == bench
          ? _value.bench
          : bench // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of GameInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ManagerModelCopyWith<$Res> get manager {
    return $ManagerModelCopyWith<$Res>(_value.manager, (value) {
      return _then(_value.copyWith(manager: value) as $Val);
    });
  }

  /// Create a copy of GameInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LineupModelCopyWith<$Res> get lineup {
    return $LineupModelCopyWith<$Res>(_value.lineup, (value) {
      return _then(_value.copyWith(lineup: value) as $Val);
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
  $Res call(
      {UserModel user,
      ManagerModel manager,
      int? score,
      LineupModel lineup,
      List<PlayerModel> bench});

  @override
  $UserModelCopyWith<$Res> get user;
  @override
  $ManagerModelCopyWith<$Res> get manager;
  @override
  $LineupModelCopyWith<$Res> get lineup;
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
    Object? manager = null,
    Object? score = freezed,
    Object? lineup = null,
    Object? bench = null,
  }) {
    return _then(_$GameInfoModelImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      manager: null == manager
          ? _value.manager
          : manager // ignore: cast_nullable_to_non_nullable
              as ManagerModel,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      lineup: null == lineup
          ? _value.lineup
          : lineup // ignore: cast_nullable_to_non_nullable
              as LineupModel,
      bench: null == bench
          ? _value._bench
          : bench // ignore: cast_nullable_to_non_nullable
              as List<PlayerModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameInfoModelImpl implements _GameInfoModel {
  _$GameInfoModelImpl(
      {required this.user,
      required this.manager,
      this.score,
      required this.lineup,
      required final List<PlayerModel> bench})
      : _bench = bench;

  factory _$GameInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameInfoModelImplFromJson(json);

  @override
  final UserModel user;
  @override
  final ManagerModel manager;
  @override
  final int? score;
  @override
  final LineupModel lineup;
  final List<PlayerModel> _bench;
  @override
  List<PlayerModel> get bench {
    if (_bench is EqualUnmodifiableListView) return _bench;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bench);
  }

  @override
  String toString() {
    return 'GameInfoModel(user: $user, manager: $manager, score: $score, lineup: $lineup, bench: $bench)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameInfoModelImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.manager, manager) || other.manager == manager) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.lineup, lineup) || other.lineup == lineup) &&
            const DeepCollectionEquality().equals(other._bench, _bench));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, manager, score, lineup,
      const DeepCollectionEquality().hash(_bench));

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
      required final ManagerModel manager,
      final int? score,
      required final LineupModel lineup,
      required final List<PlayerModel> bench}) = _$GameInfoModelImpl;

  factory _GameInfoModel.fromJson(Map<String, dynamic> json) =
      _$GameInfoModelImpl.fromJson;

  @override
  UserModel get user;
  @override
  ManagerModel get manager;
  @override
  int? get score;
  @override
  LineupModel get lineup;
  @override
  List<PlayerModel> get bench;

  /// Create a copy of GameInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameInfoModelImplCopyWith<_$GameInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
