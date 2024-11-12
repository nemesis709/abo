// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [BatterStatPage]
class BatterStatRoute extends PageRouteInfo<BatterStatRouteArgs> {
  BatterStatRoute({
    Key? key,
    required PlayerModel playerInfo,
    List<PageRouteInfo>? children,
  }) : super(
          BatterStatRoute.name,
          args: BatterStatRouteArgs(
            key: key,
            playerInfo: playerInfo,
          ),
          initialChildren: children,
        );

  static const String name = 'BatterStatRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BatterStatRouteArgs>();
      return BatterStatPage(
        key: args.key,
        playerInfo: args.playerInfo,
      );
    },
  );
}

class BatterStatRouteArgs {
  const BatterStatRouteArgs({
    this.key,
    required this.playerInfo,
  });

  final Key? key;

  final PlayerModel playerInfo;

  @override
  String toString() {
    return 'BatterStatRouteArgs{key: $key, playerInfo: $playerInfo}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainPage();
    },
  );
}

/// generated route for
/// [PitcherStatPage]
class PitcherStatRoute extends PageRouteInfo<PitcherStatRouteArgs> {
  PitcherStatRoute({
    Key? key,
    required PlayerModel playerInfo,
    List<PageRouteInfo>? children,
  }) : super(
          PitcherStatRoute.name,
          args: PitcherStatRouteArgs(
            key: key,
            playerInfo: playerInfo,
          ),
          initialChildren: children,
        );

  static const String name = 'PitcherStatRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PitcherStatRouteArgs>();
      return PitcherStatPage(
        key: args.key,
        playerInfo: args.playerInfo,
      );
    },
  );
}

class PitcherStatRouteArgs {
  const PitcherStatRouteArgs({
    this.key,
    required this.playerInfo,
  });

  final Key? key;

  final PlayerModel playerInfo;

  @override
  String toString() {
    return 'PitcherStatRouteArgs{key: $key, playerInfo: $playerInfo}';
  }
}

/// generated route for
/// [PlayerListPage]
class PlayerListRoute extends PageRouteInfo<void> {
  const PlayerListRoute({List<PageRouteInfo>? children})
      : super(
          PlayerListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlayerListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PlayerListPage();
    },
  );
}

/// generated route for
/// [RankPage]
class RankRoute extends PageRouteInfo<void> {
  const RankRoute({List<PageRouteInfo>? children})
      : super(
          RankRoute.name,
          initialChildren: children,
        );

  static const String name = 'RankRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RankPage();
    },
  );
}

/// generated route for
/// [SearchPage]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchPage();
    },
  );
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsPage();
    },
  );
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignInPage();
    },
  );
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignUpPage();
    },
  );
}

/// generated route for
/// [TradePage]
class TradeRoute extends PageRouteInfo<void> {
  const TradeRoute({List<PageRouteInfo>? children})
      : super(
          TradeRoute.name,
          initialChildren: children,
        );

  static const String name = 'TradeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TradePage();
    },
  );
}
