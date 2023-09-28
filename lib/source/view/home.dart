import 'package:abo/ui/route/app_router.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        MainRoute(),
        RankRoute(),
        TradeRoute(),
        PlayerRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
            // selectedItemColor: Colors.black,
            // unselectedItemColor: Colors.black.withOpacity(0.5),
            selectedItemColor: context.colorP10,
            unselectedItemColor: context.colorN60,
            selectedLabelStyle:
                context.textStyleB12r.copyWith(color: context.colorN20),
            unselectedLabelStyle:
                context.textStyleB12r.copyWith(color: context.colorN60),
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