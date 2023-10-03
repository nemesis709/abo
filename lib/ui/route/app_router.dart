import 'package:abo/source/domain/player_info.dart';
import 'package:abo/source/view/home.dart';
import 'package:abo/source/view/page/settings.dart';
import 'package:abo/source/view/page/signin.dart';
import 'package:abo/source/view/page/main.dart';
import 'package:abo/source/view/page/player.dart';
import 'package:abo/source/view/page/player_list.dart';
import 'package:abo/source/view/page/rank.dart';
import 'package:abo/source/view/page/search.dart';
import 'package:abo/source/view/page/signup.dart';
import 'package:abo/source/view/page/trade.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(initial: true, page: SignInRoute.page),
    AutoRoute(path: '/', page: HomeRoute.page, children: [
      AutoRoute(page: MainRoute.page),
      AutoRoute(page: RankRoute.page),
      AutoRoute(page: PlayerListRoute.page),
      AutoRoute(page: SettingsRoute.page),
    ]),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: SearchRoute.page),
    AutoRoute(page: PlayerRoute.page),
  ];
}
