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
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    RankRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RankPage(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    PlayerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlayerPage(),
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
/// [PlayerPage]
class PlayerRoute extends PageRouteInfo<void> {
  const PlayerRoute({List<PageRouteInfo>? children})
      : super(
          PlayerRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlayerRoute';

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
