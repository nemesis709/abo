import 'package:abo/source/view/page/calendar.dart';
import 'package:abo/source/view/page/home.dart';
import 'package:abo/source/view/page/info.dart';
import 'package:abo/source/view/page/main.dart';
import 'package:abo/source/view/page/player_list.dart';
import 'package:abo/source/view/page/player_roaster.dart';
import 'package:abo/source/view/page/rank.dart';
import 'package:abo/source/view/page/settings.dart';
import 'package:abo/source/view/page/signin.dart';
import 'package:abo/source/view/page/signup.dart';
import 'package:abo/source/view/page/trade.dart';
import 'package:abo/source/view/page/updatepw.dart';
import 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(initial: true, page: SignInRoute.page),
    AutoRoute(path: '/', page: HomeRoute.page, children: [
      AutoRoute(page: MainRoute.page),
      AutoRoute(page: CalendarRoute.page),
      AutoRoute(page: PlayerRoasterRoute.page),
      AutoRoute(page: SettingsRoute.page),
    ]),
    AutoRoute(page: RankRoute.page),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(path: '/updatepw', page: UpdatePWRoute.page),
    AutoRoute(page: PlayerListRoute.page),
    AutoRoute(page: InfoRoute.page),
  ];
}
