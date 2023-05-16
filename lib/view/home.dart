import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:abo/route/app_router.dart';

@RoutePage()
class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [
        MainRoute(),
        RankRoute(),
        TradeRoute(),
        PlayerRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black.withOpacity(.30),
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: '홈'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart_outlined), label: '랭크'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.published_with_changes_rounded),
                  label: '트레이드'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: '선수'),
            ]);
      },
    );
  }
}
