import 'package:abo/ui/route/app_router.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PopScope(
          child: AutoTabsScaffold(
            routes: const [
              MainRoute(),
              PlayerRoasterRoute(),
              RankRoute(),
              SettingsRoute(),
            ],
            bottomNavigationBuilder: (_, tabsRouter) {
              return BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: context.colorP10,
                  selectedItemColor: context.colorN100,
                  unselectedItemColor: context.colorN40,
                  selectedLabelStyle: context.textStyleB12r.copyWith(color: context.colorN100),
                  unselectedLabelStyle: context.textStyleB12r.copyWith(color: context.colorN40),
                  currentIndex: tabsRouter.activeIndex,
                  onTap: tabsRouter.setActiveIndex,
                  items: const [
                    BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: '홈'),
                    BottomNavigationBarItem(icon: Icon(Icons.person), label: '로스터'),
                    BottomNavigationBarItem(icon: Icon(Icons.bar_chart_outlined), label: '랭크'),
                    BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정'),
                  ]);
            },
          ),
        ),
      ],
    );
  }
}
