// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batter_stat_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$batterStatControllerHash() =>
    r'ba9af8998eb42c2cd2203d6eee3e2262cbca62a6';

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

abstract class _$BatterStatController
    extends BuildlessAutoDisposeAsyncNotifier<BatterStatModel> {
  late final PlayerModel playerModel;

  FutureOr<BatterStatModel> build(
    PlayerModel playerModel,
  );
}

/// See also [BatterStatController].
@ProviderFor(BatterStatController)
const batterStatControllerProvider = BatterStatControllerFamily();

/// See also [BatterStatController].
class BatterStatControllerFamily extends Family<AsyncValue<BatterStatModel>> {
  /// See also [BatterStatController].
  const BatterStatControllerFamily();

  /// See also [BatterStatController].
  BatterStatControllerProvider call(
    PlayerModel playerModel,
  ) {
    return BatterStatControllerProvider(
      playerModel,
    );
  }

  @override
  BatterStatControllerProvider getProviderOverride(
    covariant BatterStatControllerProvider provider,
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
  String? get name => r'batterStatControllerProvider';
}

/// See also [BatterStatController].
class BatterStatControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    BatterStatController, BatterStatModel> {
  /// See also [BatterStatController].
  BatterStatControllerProvider(
    PlayerModel playerModel,
  ) : this._internal(
          () => BatterStatController()..playerModel = playerModel,
          from: batterStatControllerProvider,
          name: r'batterStatControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$batterStatControllerHash,
          dependencies: BatterStatControllerFamily._dependencies,
          allTransitiveDependencies:
              BatterStatControllerFamily._allTransitiveDependencies,
          playerModel: playerModel,
        );

  BatterStatControllerProvider._internal(
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
  FutureOr<BatterStatModel> runNotifierBuild(
    covariant BatterStatController notifier,
  ) {
    return notifier.build(
      playerModel,
    );
  }

  @override
  Override overrideWith(BatterStatController Function() create) {
    return ProviderOverride(
      origin: this,
      override: BatterStatControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<BatterStatController, BatterStatModel>
      createElement() {
    return _BatterStatControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BatterStatControllerProvider &&
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
mixin BatterStatControllerRef
    on AutoDisposeAsyncNotifierProviderRef<BatterStatModel> {
  /// The parameter `playerModel` of this provider.
  PlayerModel get playerModel;
}

class _BatterStatControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<BatterStatController,
        BatterStatModel> with BatterStatControllerRef {
  _BatterStatControllerProviderElement(super.provider);

  @override
  PlayerModel get playerModel =>
      (origin as BatterStatControllerProvider).playerModel;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
