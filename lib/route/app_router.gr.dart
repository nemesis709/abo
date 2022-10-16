// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../view/home.dart' as _i1;
import '../view/main.dart' as _i2;
import '../view/player.dart' as _i5;
import '../view/rank.dart' as _i3;
import '../view/trade.dart' as _i4;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.MainPage(),
      );
    },
    RankRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.RankPage(),
      );
    },
    TradeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.TradePage(),
      );
    },
    PlayerRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.PlayerPage(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          HomeRoute.name,
          path: '/',
          children: [
            _i6.RouteConfig(
              MainRoute.name,
              path: 'main-page',
              parent: HomeRoute.name,
            ),
            _i6.RouteConfig(
              RankRoute.name,
              path: 'rank-page',
              parent: HomeRoute.name,
            ),
            _i6.RouteConfig(
              TradeRoute.name,
              path: 'trade-page',
              parent: HomeRoute.name,
            ),
            _i6.RouteConfig(
              PlayerRoute.name,
              path: 'player-page',
              parent: HomeRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i6.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: 'main-page',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.RankPage]
class RankRoute extends _i6.PageRouteInfo<void> {
  const RankRoute()
      : super(
          RankRoute.name,
          path: 'rank-page',
        );

  static const String name = 'RankRoute';
}

/// generated route for
/// [_i4.TradePage]
class TradeRoute extends _i6.PageRouteInfo<void> {
  const TradeRoute()
      : super(
          TradeRoute.name,
          path: 'trade-page',
        );

  static const String name = 'TradeRoute';
}

/// generated route for
/// [_i5.PlayerPage]
class PlayerRoute extends _i6.PageRouteInfo<void> {
  const PlayerRoute()
      : super(
          PlayerRoute.name,
          path: 'player-page',
        );

  static const String name = 'PlayerRoute';
}
