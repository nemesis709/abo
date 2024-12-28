// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlayerModel _$PlayerModelFromJson(Map<String, dynamic> json) {
  return _PlayerModel.fromJson(json);
}

/// @nodoc
mixin _$PlayerModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  UserModel? get owner => throw _privateConstructorUsedError;
  int get teamId => throw _privateConstructorUsedError;
  @PositionJsonConverter()
  Position get position => throw _privateConstructorUsedError;
  DateTime get birthDate => throw _privateConstructorUsedError;
  String get hand => throw _privateConstructorUsedError;
  bool get isPitcher => throw _privateConstructorUsedError;
  bool? get onPosition => throw _privateConstructorUsedError;
  int? get positionNumber => throw _privateConstructorUsedError;
  int? get lineupNumber => throw _privateConstructorUsedError;
  bool? get isForeigner => throw _privateConstructorUsedError;
  bool? get onTrade => throw _privateConstructorUsedError;
  int? get point => throw _privateConstructorUsedError;
  BatterStatModel? get batterStatModel => throw _privateConstructorUsedError;
  BatterDailyStatModel? get batterDailyStatModel =>
      throw _privateConstructorUsedError;
  PitcherStatModel? get pitcherStatModel => throw _privateConstructorUsedError;
  PitcherDailyStatModel? get pitcherDailyStatModel =>
      throw _privateConstructorUsedError;

  /// Serializes this PlayerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlayerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayerModelCopyWith<PlayerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerModelCopyWith<$Res> {
  factory $PlayerModelCopyWith(
          PlayerModel value, $Res Function(PlayerModel) then) =
      _$PlayerModelCopyWithImpl<$Res, PlayerModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      UserModel? owner,
      int teamId,
      @PositionJsonConverter() Position position,
      DateTime birthDate,
      String hand,
      bool isPitcher,
      bool? onPosition,
      int? positionNumber,
      int? lineupNumber,
      bool? isForeigner,
      bool? onTrade,
      int? point,
      BatterStatModel? batterStatModel,
      BatterDailyStatModel? batterDailyStatModel,
      PitcherStatModel? pitcherStatModel,
      PitcherDailyStatModel? pitcherDailyStatModel});

  $UserModelCopyWith<$Res>? get owner;
  $BatterStatModelCopyWith<$Res>? get batterStatModel;
  $BatterDailyStatModelCopyWith<$Res>? get batterDailyStatModel;
  $PitcherStatModelCopyWith<$Res>? get pitcherStatModel;
  $PitcherDailyStatModelCopyWith<$Res>? get pitcherDailyStatModel;
}

/// @nodoc
class _$PlayerModelCopyWithImpl<$Res, $Val extends PlayerModel>
    implements $PlayerModelCopyWith<$Res> {
  _$PlayerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlayerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? owner = freezed,
    Object? teamId = null,
    Object? position = null,
    Object? birthDate = null,
    Object? hand = null,
    Object? isPitcher = null,
    Object? onPosition = freezed,
    Object? positionNumber = freezed,
    Object? lineupNumber = freezed,
    Object? isForeigner = freezed,
    Object? onTrade = freezed,
    Object? point = freezed,
    Object? batterStatModel = freezed,
    Object? batterDailyStatModel = freezed,
    Object? pitcherStatModel = freezed,
    Object? pitcherDailyStatModel = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hand: null == hand
          ? _value.hand
          : hand // ignore: cast_nullable_to_non_nullable
              as String,
      isPitcher: null == isPitcher
          ? _value.isPitcher
          : isPitcher // ignore: cast_nullable_to_non_nullable
              as bool,
      onPosition: freezed == onPosition
          ? _value.onPosition
          : onPosition // ignore: cast_nullable_to_non_nullable
              as bool?,
      positionNumber: freezed == positionNumber
          ? _value.positionNumber
          : positionNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      lineupNumber: freezed == lineupNumber
          ? _value.lineupNumber
          : lineupNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      isForeigner: freezed == isForeigner
          ? _value.isForeigner
          : isForeigner // ignore: cast_nullable_to_non_nullable
              as bool?,
      onTrade: freezed == onTrade
          ? _value.onTrade
          : onTrade // ignore: cast_nullable_to_non_nullable
              as bool?,
      point: freezed == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int?,
      batterStatModel: freezed == batterStatModel
          ? _value.batterStatModel
          : batterStatModel // ignore: cast_nullable_to_non_nullable
              as BatterStatModel?,
      batterDailyStatModel: freezed == batterDailyStatModel
          ? _value.batterDailyStatModel
          : batterDailyStatModel // ignore: cast_nullable_to_non_nullable
              as BatterDailyStatModel?,
      pitcherStatModel: freezed == pitcherStatModel
          ? _value.pitcherStatModel
          : pitcherStatModel // ignore: cast_nullable_to_non_nullable
              as PitcherStatModel?,
      pitcherDailyStatModel: freezed == pitcherDailyStatModel
          ? _value.pitcherDailyStatModel
          : pitcherDailyStatModel // ignore: cast_nullable_to_non_nullable
              as PitcherDailyStatModel?,
    ) as $Val);
  }

  /// Create a copy of PlayerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get owner {
    if (_value.owner == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.owner!, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }

  /// Create a copy of PlayerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BatterStatModelCopyWith<$Res>? get batterStatModel {
    if (_value.batterStatModel == null) {
      return null;
    }

    return $BatterStatModelCopyWith<$Res>(_value.batterStatModel!, (value) {
      return _then(_value.copyWith(batterStatModel: value) as $Val);
    });
  }

  /// Create a copy of PlayerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BatterDailyStatModelCopyWith<$Res>? get batterDailyStatModel {
    if (_value.batterDailyStatModel == null) {
      return null;
    }

    return $BatterDailyStatModelCopyWith<$Res>(_value.batterDailyStatModel!,
        (value) {
      return _then(_value.copyWith(batterDailyStatModel: value) as $Val);
    });
  }

  /// Create a copy of PlayerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PitcherStatModelCopyWith<$Res>? get pitcherStatModel {
    if (_value.pitcherStatModel == null) {
      return null;
    }

    return $PitcherStatModelCopyWith<$Res>(_value.pitcherStatModel!, (value) {
      return _then(_value.copyWith(pitcherStatModel: value) as $Val);
    });
  }

  /// Create a copy of PlayerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PitcherDailyStatModelCopyWith<$Res>? get pitcherDailyStatModel {
    if (_value.pitcherDailyStatModel == null) {
      return null;
    }

    return $PitcherDailyStatModelCopyWith<$Res>(_value.pitcherDailyStatModel!,
        (value) {
      return _then(_value.copyWith(pitcherDailyStatModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlayerModelImplCopyWith<$Res>
    implements $PlayerModelCopyWith<$Res> {
  factory _$$PlayerModelImplCopyWith(
          _$PlayerModelImpl value, $Res Function(_$PlayerModelImpl) then) =
      __$$PlayerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      UserModel? owner,
      int teamId,
      @PositionJsonConverter() Position position,
      DateTime birthDate,
      String hand,
      bool isPitcher,
      bool? onPosition,
      int? positionNumber,
      int? lineupNumber,
      bool? isForeigner,
      bool? onTrade,
      int? point,
      BatterStatModel? batterStatModel,
      BatterDailyStatModel? batterDailyStatModel,
      PitcherStatModel? pitcherStatModel,
      PitcherDailyStatModel? pitcherDailyStatModel});

  @override
  $UserModelCopyWith<$Res>? get owner;
  @override
  $BatterStatModelCopyWith<$Res>? get batterStatModel;
  @override
  $BatterDailyStatModelCopyWith<$Res>? get batterDailyStatModel;
  @override
  $PitcherStatModelCopyWith<$Res>? get pitcherStatModel;
  @override
  $PitcherDailyStatModelCopyWith<$Res>? get pitcherDailyStatModel;
}

/// @nodoc
class __$$PlayerModelImplCopyWithImpl<$Res>
    extends _$PlayerModelCopyWithImpl<$Res, _$PlayerModelImpl>
    implements _$$PlayerModelImplCopyWith<$Res> {
  __$$PlayerModelImplCopyWithImpl(
      _$PlayerModelImpl _value, $Res Function(_$PlayerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? owner = freezed,
    Object? teamId = null,
    Object? position = null,
    Object? birthDate = null,
    Object? hand = null,
    Object? isPitcher = null,
    Object? onPosition = freezed,
    Object? positionNumber = freezed,
    Object? lineupNumber = freezed,
    Object? isForeigner = freezed,
    Object? onTrade = freezed,
    Object? point = freezed,
    Object? batterStatModel = freezed,
    Object? batterDailyStatModel = freezed,
    Object? pitcherStatModel = freezed,
    Object? pitcherDailyStatModel = freezed,
  }) {
    return _then(_$PlayerModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hand: null == hand
          ? _value.hand
          : hand // ignore: cast_nullable_to_non_nullable
              as String,
      isPitcher: null == isPitcher
          ? _value.isPitcher
          : isPitcher // ignore: cast_nullable_to_non_nullable
              as bool,
      onPosition: freezed == onPosition
          ? _value.onPosition
          : onPosition // ignore: cast_nullable_to_non_nullable
              as bool?,
      positionNumber: freezed == positionNumber
          ? _value.positionNumber
          : positionNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      lineupNumber: freezed == lineupNumber
          ? _value.lineupNumber
          : lineupNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      isForeigner: freezed == isForeigner
          ? _value.isForeigner
          : isForeigner // ignore: cast_nullable_to_non_nullable
              as bool?,
      onTrade: freezed == onTrade
          ? _value.onTrade
          : onTrade // ignore: cast_nullable_to_non_nullable
              as bool?,
      point: freezed == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int?,
      batterStatModel: freezed == batterStatModel
          ? _value.batterStatModel
          : batterStatModel // ignore: cast_nullable_to_non_nullable
              as BatterStatModel?,
      batterDailyStatModel: freezed == batterDailyStatModel
          ? _value.batterDailyStatModel
          : batterDailyStatModel // ignore: cast_nullable_to_non_nullable
              as BatterDailyStatModel?,
      pitcherStatModel: freezed == pitcherStatModel
          ? _value.pitcherStatModel
          : pitcherStatModel // ignore: cast_nullable_to_non_nullable
              as PitcherStatModel?,
      pitcherDailyStatModel: freezed == pitcherDailyStatModel
          ? _value.pitcherDailyStatModel
          : pitcherDailyStatModel // ignore: cast_nullable_to_non_nullable
              as PitcherDailyStatModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerModelImpl implements _PlayerModel {
  _$PlayerModelImpl(
      {required this.id,
      required this.name,
      this.owner,
      required this.teamId,
      @PositionJsonConverter() required this.position,
      required this.birthDate,
      required this.hand,
      required this.isPitcher,
      this.onPosition,
      this.positionNumber,
      this.lineupNumber,
      this.isForeigner,
      this.onTrade,
      this.point,
      this.batterStatModel,
      this.batterDailyStatModel,
      this.pitcherStatModel,
      this.pitcherDailyStatModel});

  factory _$PlayerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final UserModel? owner;
  @override
  final int teamId;
  @override
  @PositionJsonConverter()
  final Position position;
  @override
  final DateTime birthDate;
  @override
  final String hand;
  @override
  final bool isPitcher;
  @override
  final bool? onPosition;
  @override
  final int? positionNumber;
  @override
  final int? lineupNumber;
  @override
  final bool? isForeigner;
  @override
  final bool? onTrade;
  @override
  final int? point;
  @override
  final BatterStatModel? batterStatModel;
  @override
  final BatterDailyStatModel? batterDailyStatModel;
  @override
  final PitcherStatModel? pitcherStatModel;
  @override
  final PitcherDailyStatModel? pitcherDailyStatModel;

  @override
  String toString() {
    return 'PlayerModel(id: $id, name: $name, owner: $owner, teamId: $teamId, position: $position, birthDate: $birthDate, hand: $hand, isPitcher: $isPitcher, onPosition: $onPosition, positionNumber: $positionNumber, lineupNumber: $lineupNumber, isForeigner: $isForeigner, onTrade: $onTrade, point: $point, batterStatModel: $batterStatModel, batterDailyStatModel: $batterDailyStatModel, pitcherStatModel: $pitcherStatModel, pitcherDailyStatModel: $pitcherDailyStatModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.hand, hand) || other.hand == hand) &&
            (identical(other.isPitcher, isPitcher) ||
                other.isPitcher == isPitcher) &&
            (identical(other.onPosition, onPosition) ||
                other.onPosition == onPosition) &&
            (identical(other.positionNumber, positionNumber) ||
                other.positionNumber == positionNumber) &&
            (identical(other.lineupNumber, lineupNumber) ||
                other.lineupNumber == lineupNumber) &&
            (identical(other.isForeigner, isForeigner) ||
                other.isForeigner == isForeigner) &&
            (identical(other.onTrade, onTrade) || other.onTrade == onTrade) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.batterStatModel, batterStatModel) ||
                other.batterStatModel == batterStatModel) &&
            (identical(other.batterDailyStatModel, batterDailyStatModel) ||
                other.batterDailyStatModel == batterDailyStatModel) &&
            (identical(other.pitcherStatModel, pitcherStatModel) ||
                other.pitcherStatModel == pitcherStatModel) &&
            (identical(other.pitcherDailyStatModel, pitcherDailyStatModel) ||
                other.pitcherDailyStatModel == pitcherDailyStatModel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      owner,
      teamId,
      position,
      birthDate,
      hand,
      isPitcher,
      onPosition,
      positionNumber,
      lineupNumber,
      isForeigner,
      onTrade,
      point,
      batterStatModel,
      batterDailyStatModel,
      pitcherStatModel,
      pitcherDailyStatModel);

  /// Create a copy of PlayerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerModelImplCopyWith<_$PlayerModelImpl> get copyWith =>
      __$$PlayerModelImplCopyWithImpl<_$PlayerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerModelImplToJson(
      this,
    );
  }
}

abstract class _PlayerModel implements PlayerModel {
  factory _PlayerModel(
      {required final int id,
      required final String name,
      final UserModel? owner,
      required final int teamId,
      @PositionJsonConverter() required final Position position,
      required final DateTime birthDate,
      required final String hand,
      required final bool isPitcher,
      final bool? onPosition,
      final int? positionNumber,
      final int? lineupNumber,
      final bool? isForeigner,
      final bool? onTrade,
      final int? point,
      final BatterStatModel? batterStatModel,
      final BatterDailyStatModel? batterDailyStatModel,
      final PitcherStatModel? pitcherStatModel,
      final PitcherDailyStatModel? pitcherDailyStatModel}) = _$PlayerModelImpl;

  factory _PlayerModel.fromJson(Map<String, dynamic> json) =
      _$PlayerModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  UserModel? get owner;
  @override
  int get teamId;
  @override
  @PositionJsonConverter()
  Position get position;
  @override
  DateTime get birthDate;
  @override
  String get hand;
  @override
  bool get isPitcher;
  @override
  bool? get onPosition;
  @override
  int? get positionNumber;
  @override
  int? get lineupNumber;
  @override
  bool? get isForeigner;
  @override
  bool? get onTrade;
  @override
  int? get point;
  @override
  BatterStatModel? get batterStatModel;
  @override
  BatterDailyStatModel? get batterDailyStatModel;
  @override
  PitcherStatModel? get pitcherStatModel;
  @override
  PitcherDailyStatModel? get pitcherDailyStatModel;

  /// Create a copy of PlayerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerModelImplCopyWith<_$PlayerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
