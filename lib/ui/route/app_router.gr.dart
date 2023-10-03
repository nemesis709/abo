// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BatterStatRoute.name: (routeData) {
      final args = routeData.argsAs<BatterStatRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BatterStatPage(
          key: args.key,
          playerInfo: args.playerInfo,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    PitcherStatRoute.name: (routeData) {
      final args = routeData.argsAs<PitcherStatRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PitcherStatPage(
          key: args.key,
          playerInfo: args.playerInfo,
        ),
      );
    },
    PlayerListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlayerListPage(),
      );
    },
    RankRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RankPage(),
      );
    },
    SearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpPage(),
      );
    },
    TradeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TradePage(),
      );
    },
  };
}

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

  static const PageInfo<BatterStatRouteArgs> page =
      PageInfo<BatterStatRouteArgs>(name);
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

  static const PageInfo<void> page = PageInfo<void>(name);
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

  static const PageInfo<void> page = PageInfo<void>(name);
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

  static const PageInfo<PitcherStatRouteArgs> page =
      PageInfo<PitcherStatRouteArgs>(name);
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

  static const PageInfo<void> page = PageInfo<void>(name);
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

  static const PageInfo<void> page = PageInfo<void>(name);
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

  static const PageInfo<void> page = PageInfo<void>(name);
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

  static const PageInfo<void> page = PageInfo<void>(name);
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

  static const PageInfo<void> page = PageInfo<void>(name);
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

  static const PageInfo<void> page = PageInfo<void>(name);
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

  static const PageInfo<void> page = PageInfo<void>(name);
}
