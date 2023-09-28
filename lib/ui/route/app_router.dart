import 'package:abo/source/view/home.dart';
import 'package:abo/source/view/page/main.dart';
import 'package:abo/source/view/page/player.dart';
import 'package:abo/source/view/page/rank.dart';
import 'package:abo/source/view/page/trade.dart';
import 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
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
