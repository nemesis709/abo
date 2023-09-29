import 'package:abo/common/common_constants.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class MainPage extends HookWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "홈",
          style: context.textStyleH20b.copyWith(color: context.colorP10),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _ScoreBoard(),
            Gap.h16,
            _RankBoard(),
            // Gap.h16,
            // _TradeBoard(),
            Gap.h40,
          ],
        ),
      ),
    );
  }
}

class _RankBoard extends HookWidget {
  final List<String> manager = <String>['장세민', '장세훈', '정재민'];
  final List<String> player = <String>['고영표', '소형준', '엄상백'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Gap.w16,
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: context.colorP10, width: 2),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('감독 랭킹',
                      style: context.textStyleT12b
                          .copyWith(color: context.colorP10)),
                  _DisplayRank(list: manager),
                ],
              ),
            ),
          ),
        ),
        Gap.w16,
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: context.colorP10, width: 2),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('선수 랭킹',
                      style: context.textStyleT12b
                          .copyWith(color: context.colorP10)),
                  _DisplayRank(list: player),
                ],
              ),
            ),
          ),
        ),
        Gap.w16,
      ],
    );
  }
}

class _DisplayRank extends HookConsumerWidget {
  const _DisplayRank({required this.list});

  final List<String> list;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: list.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 50,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: context.textStyleT14r.fontSize! * 2,
                        child:
                            Text('${index + 1}', style: context.textStyleT14r)),
                    Gap.w8,
                    Text(list[index], style: context.textStyleT14r),
                  ],
                ),
              ],
            ),
          );
        });
  }
}

class _ScoreBoard extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final tap = useState(false);

    final controller = useAnimationController(initialValue: 1);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: context.colorP10, width: 2),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedSwitcher(
            duration: Durations.ms300,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return SizeTransition(
                sizeFactor: CurvedAnimation(
                  parent: controller,
                  curve: Curves.easeIn,
                ),
                axis: Axis.vertical,
                child: child,
              );
            },
            child: tap.value == true
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('실시간 스코어',
                              style: context.textStyleT12b
                                  .copyWith(color: context.colorP10)),
                          IconButton(
                              onPressed: () => tap.value = !tap.value,
                              icon: Icon(Icons.keyboard_arrow_down)),
                        ],
                      ),
                      Gap.h8,
                      const _ScoreView(
                        home: 'SSG',
                        homeScore: 3,
                        away: 'NC',
                        awayScore: 1,
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('실시간 스코어',
                              style: context.textStyleT12b
                                  .copyWith(color: context.colorP10)),
                          IconButton(
                              onPressed: () => tap.value = !tap.value,
                              icon: Icon(Icons.keyboard_arrow_up)),
                        ],
                      ),
                      Gap.h8,
                      const _ScoreView(
                        home: 'KT',
                        homeScore: 3,
                        away: 'LG',
                        awayScore: 1,
                      ),
                      Gap.h8,
                      const _ScoreView(
                        home: 'SSG',
                        homeScore: 3,
                        away: 'NC',
                        awayScore: 1,
                      ),
                      Gap.h8,
                      const _ScoreView(
                        home: '한화',
                        homeScore: 3,
                        away: '두산',
                        awayScore: 1,
                      ),
                      Gap.h8,
                      const _ScoreView(
                        home: '삼성',
                        homeScore: 3,
                        away: '키움',
                        awayScore: 1,
                      ),
                      Gap.h8,
                      const _ScoreView(
                        home: 'KIA',
                        homeScore: 3,
                        away: '롯데',
                        awayScore: 1,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class _ScoreView extends HookWidget {
  const _ScoreView({
    required this.home,
    required this.away,
    required this.homeScore,
    required this.awayScore,
  });

  final String home;
  final String away;
  final int homeScore;
  final int awayScore;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Center(child: Text(away))),
            Expanded(child: Center(child: Text(awayScore.toString()))),
            const Expanded(flex: 3, child: Center(child: Text('종료'))),
            Expanded(child: Center(child: Text(homeScore.toString()))),
            Expanded(child: Center(child: Text(home))),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Center(child: Text('와이드너'))),
            Spacer(flex: 3),
            Expanded(child: Center(child: Text('와이드너'))),
          ],
        )
      ],
    );
  }
}

class _TradeBoard extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: context.colorP10, width: 2),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('트레이드',
                  style:
                      context.textStyleT12b.copyWith(color: context.colorP10)),
              Gap.h8,
              const Row(
                children: [
                  Text('박찬호'),
                ],
              ),
              const Row(
                children: [
                  Text('고영표'),
                ],
              ),
              const Row(
                children: [
                  Text('노시환'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
