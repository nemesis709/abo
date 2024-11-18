// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$calendarControllerHash() =>
    r'7c2591f6e44638ff95c4cc8867bee0a297c7c8d6';

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

abstract class _$CalendarController
    extends BuildlessAutoDisposeAsyncNotifier<List<GameModel>> {
  late final DateTime dateTime;

  FutureOr<List<GameModel>> build({
    required DateTime dateTime,
  });
}

/// See also [CalendarController].
@ProviderFor(CalendarController)
const calendarControllerProvider = CalendarControllerFamily();

/// See also [CalendarController].
class CalendarControllerFamily extends Family<AsyncValue<List<GameModel>>> {
  /// See also [CalendarController].
  const CalendarControllerFamily();

  /// See also [CalendarController].
  CalendarControllerProvider call({
    required DateTime dateTime,
  }) {
    return CalendarControllerProvider(
      dateTime: dateTime,
    );
  }

  @override
  CalendarControllerProvider getProviderOverride(
    covariant CalendarControllerProvider provider,
  ) {
    return call(
      dateTime: provider.dateTime,
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
  String? get name => r'calendarControllerProvider';
}

/// See also [CalendarController].
class CalendarControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    CalendarController, List<GameModel>> {
  /// See also [CalendarController].
  CalendarControllerProvider({
    required DateTime dateTime,
  }) : this._internal(
          () => CalendarController()..dateTime = dateTime,
          from: calendarControllerProvider,
          name: r'calendarControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$calendarControllerHash,
          dependencies: CalendarControllerFamily._dependencies,
          allTransitiveDependencies:
              CalendarControllerFamily._allTransitiveDependencies,
          dateTime: dateTime,
        );

  CalendarControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dateTime,
  }) : super.internal();

  final DateTime dateTime;

  @override
  FutureOr<List<GameModel>> runNotifierBuild(
    covariant CalendarController notifier,
  ) {
    return notifier.build(
      dateTime: dateTime,
    );
  }

  @override
  Override overrideWith(CalendarController Function() create) {
    return ProviderOverride(
      origin: this,
      override: CalendarControllerProvider._internal(
        () => create()..dateTime = dateTime,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dateTime: dateTime,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CalendarController, List<GameModel>>
      createElement() {
    return _CalendarControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CalendarControllerProvider && other.dateTime == dateTime;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dateTime.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CalendarControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<GameModel>> {
  /// The parameter `dateTime` of this provider.
  DateTime get dateTime;
}

class _CalendarControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CalendarController,
        List<GameModel>> with CalendarControllerRef {
  _CalendarControllerProviderElement(super.provider);

  @override
  DateTime get dateTime => (origin as CalendarControllerProvider).dateTime;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
