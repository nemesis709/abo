// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playerControllerHash() => r'5fff3acd6a49edda1e18b0c5cea2c29cb13e7c1b';

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

abstract class _$PlayerController
    extends BuildlessAutoDisposeAsyncNotifier<List<PlayerModel>> {
  late final bool? isPitcher;

  FutureOr<List<PlayerModel>> build(
    bool? isPitcher,
  );
}

/// See also [PlayerController].
@ProviderFor(PlayerController)
const playerControllerProvider = PlayerControllerFamily();

/// See also [PlayerController].
class PlayerControllerFamily extends Family<AsyncValue<List<PlayerModel>>> {
  /// See also [PlayerController].
  const PlayerControllerFamily();

  /// See also [PlayerController].
  PlayerControllerProvider call(
    bool? isPitcher,
  ) {
    return PlayerControllerProvider(
      isPitcher,
    );
  }

  @override
  PlayerControllerProvider getProviderOverride(
    covariant PlayerControllerProvider provider,
  ) {
    return call(
      provider.isPitcher,
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
  String? get name => r'playerControllerProvider';
}

/// See also [PlayerController].
class PlayerControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    PlayerController, List<PlayerModel>> {
  /// See also [PlayerController].
  PlayerControllerProvider(
    bool? isPitcher,
  ) : this._internal(
          () => PlayerController()..isPitcher = isPitcher,
          from: playerControllerProvider,
          name: r'playerControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playerControllerHash,
          dependencies: PlayerControllerFamily._dependencies,
          allTransitiveDependencies:
              PlayerControllerFamily._allTransitiveDependencies,
          isPitcher: isPitcher,
        );

  PlayerControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.isPitcher,
  }) : super.internal();

  final bool? isPitcher;

  @override
  FutureOr<List<PlayerModel>> runNotifierBuild(
    covariant PlayerController notifier,
  ) {
    return notifier.build(
      isPitcher,
    );
  }

  @override
  Override overrideWith(PlayerController Function() create) {
    return ProviderOverride(
      origin: this,
      override: PlayerControllerProvider._internal(
        () => create()..isPitcher = isPitcher,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        isPitcher: isPitcher,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<PlayerController, List<PlayerModel>>
      createElement() {
    return _PlayerControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayerControllerProvider && other.isPitcher == isPitcher;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, isPitcher.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PlayerControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<PlayerModel>> {
  /// The parameter `isPitcher` of this provider.
  bool? get isPitcher;
}

class _PlayerControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PlayerController,
        List<PlayerModel>> with PlayerControllerRef {
  _PlayerControllerProviderElement(super.provider);

  @override
  bool? get isPitcher => (origin as PlayerControllerProvider).isPitcher;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
