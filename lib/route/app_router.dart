import 'package:auto_route/auto_route.dart';
import 'package:abo/view/home.dart';
import 'package:abo/view/main.dart';
import 'package:abo/view/player.dart';
import 'package:abo/view/rank.dart';
import 'package:abo/view/trade.dart';

export 'app_router.gr.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(page: HomePage, initial: true, children: [
    AutoRoute(page: MainPage),
    AutoRoute(page: RankPage),
    AutoRoute(page: TradePage),
    AutoRoute(page: PlayerPage),
  ]),
])
class $AppRouter {}
