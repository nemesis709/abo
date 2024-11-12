// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pitcher_stat_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pitcherStatControllerHash() =>
    r'c925c89bf782f0fcd3687b54cb1c9baad84a6da4';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$PitcherStatController
    extends BuildlessAutoDisposeAsyncNotifier<PitcherStatModel> {
  late final PlayerModel playerModel;

  FutureOr<PitcherStatModel> build(
    PlayerModel playerModel,
  );
}

/// See also [PitcherStatController].
@ProviderFor(PitcherStatController)
const pitcherStatControllerProvider = PitcherStatControllerFamily();

/// See also [PitcherStatController].
class PitcherStatControllerFamily extends Family<AsyncValue<PitcherStatModel>> {
  /// See also [PitcherStatController].
  const PitcherStatControllerFamily();

  /// See also [PitcherStatController].
  PitcherStatControllerProvider call(
    PlayerModel playerModel,
  ) {
    return PitcherStatControllerProvider(
      playerModel,
    );
  }

  @override
  PitcherStatControllerProvider getProviderOverride(
    covariant PitcherStatControllerProvider provider,
  ) {
    return call(
      provider.playerModel,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pitcherStatControllerProvider';
}

/// See also [PitcherStatController].
class PitcherStatControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<PitcherStatController,
        PitcherStatModel> {
  /// See also [PitcherStatController].
  PitcherStatControllerProvider(
    PlayerModel playerModel,
  ) : this._internal(
          () => PitcherStatController()..playerModel = playerModel,
          from: pitcherStatControllerProvider,
          name: r'pitcherStatControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pitcherStatControllerHash,
          dependencies: PitcherStatControllerFamily._dependencies,
          allTransitiveDependencies:
              PitcherStatControllerFamily._allTransitiveDependencies,
          playerModel: playerModel,
        );

  PitcherStatControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.playerModel,
  }) : super.internal();

  final PlayerModel playerModel;

  @override
  FutureOr<PitcherStatModel> runNotifierBuild(
    covariant PitcherStatController notifier,
  ) {
    return notifier.build(
      playerModel,
    );
  }

  @override
  Override overrideWith(PitcherStatController Function() create) {
    return ProviderOverride(
      origin: this,
      override: PitcherStatControllerProvider._internal(
        () => create()..playerModel = playerModel,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        playerModel: playerModel,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<PitcherStatController,
      PitcherStatModel> createElement() {
    return _PitcherStatControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PitcherStatControllerProvider &&
        other.playerModel == playerModel;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, playerModel.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PitcherStatControllerRef
    on AutoDisposeAsyncNotifierProviderRef<PitcherStatModel> {
  /// The parameter `playerModel` of this provider.
  PlayerModel get playerModel;
}

class _PitcherStatControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PitcherStatController,
        PitcherStatModel> with PitcherStatControllerRef {
  _PitcherStatControllerProviderElement(super.provider);

  @override
  PlayerModel get playerModel =>
      (origin as PitcherStatControllerProvider).playerModel;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
