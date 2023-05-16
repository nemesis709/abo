import 'package:auto_route/auto_route.dart';
import 'package:abo/view/home.dart';
import 'package:abo/view/main.dart';
import 'package:abo/view/player.dart';
import 'package:abo/view/rank.dart';
import 'package:abo/view/trade.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();
  @override
  final List<AutoRoute> routes = [
      AutoRoute(path: '/', page: HomeRoute.page, children:[
        AutoRoute(page: MainRoute.page),
        AutoRoute(page: RankRoute.page),
        AutoRoute(page: TradeRoute.page),
        AutoRoute(page: PlayerRoute.page),
      ]),
  ];
}
