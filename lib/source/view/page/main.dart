import 'dart:math';

import 'package:abo/common/common_constants.dart';
import 'package:abo/common/extension/build_context_extension.dart';
import 'package:abo/common/loadable_content.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/controller/player_controller.dart';
import 'package:abo/source/controller/user_controller.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:abo/source/view/page/batter_stat.dart';
import 'package:abo/source/view/page/pitcher_stat.dart';
import 'package:abo/ui/route/app_router.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:abo/source/view/widget/default_bottom_sheet.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () => context.pushRoute(PlayerListRoute()),
            child: Icon(Icons.search),
          ),
          Gap.w16,
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // _ScoreBoard(),
              // Gap.h16,
              _RankBoard(),
              Gap.h16,
              _TradeBoard(),
              Gap.h40,
            ],
          ),
        ),
      ),
    );
  }
}

class _RankBoard extends ConsumerStatefulWidget {
  @override
  ConsumerState<_RankBoard> createState() => _RankBoardState();
}

class _RankBoardState extends ConsumerState<_RankBoard> {
  bool isManager = true;

  @override
  Widget build(BuildContext context) {
    final manager = ref.watch(userControllerProvider);
    final player = ref.watch(playerControllerProvider(null));

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.colorP10, width: 2),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  '랭킹',
                  style: context.textStyleT16b.copyWith(color: context.colorP10),
                ),
                Spacer(),
                InkWell(
                  onTap: () => setState(() {
                    isManager = true;
                  }),
                  child: Text(
                    '감독',
                    style:
                        (isManager ? context.textStyleT16b : context.textStyleT16r).copyWith(color: context.colorP10),
                  ),
                ),
                Text(' | '),
                InkWell(
                  onTap: () => setState(() {
                    isManager = false;
                  }),
                  child: Text(
                    '선수',
                    style:
                        (isManager ? context.textStyleT16r : context.textStyleT16b).copyWith(color: context.colorP10),
                  ),
                ),
              ],
            ),
            isManager ? _ManagerRank(manager: manager) : _PlayerRank(player: player),
          ],
        ),
      ),
    );
  }
}

class _ManagerRank extends StatelessWidget {
  const _ManagerRank({
    required this.manager,
  });

  final AsyncValue<List<UserModel>> manager;

  @override
  Widget build(BuildContext context) {
    return LoadableContent(
        asyncValue: manager,
        content: (manager) {
          final list = manager.map((e) => e.name).toList();
          return ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: min(10, list.length),
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
                              child: Text('${index + 1}', style: context.textStyleT14r)),
                          Gap.w8,
                          Text(list[index], style: context.textStyleT14r),
                        ],
                      ),
                    ],
                  ),
                );
              });
        });
  }
}

class _PlayerRank extends StatelessWidget {
  const _PlayerRank({
    required this.player,
  });

  final AsyncValue<List<PlayerModel>> player;

  @override
  Widget build(BuildContext context) {
    return LoadableContent(
        asyncValue: player,
        content: (player) {
          return ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: min(player.length, 10),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 50,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: context.textStyleT14r.fontSize! * 2,
                              child: Text('${index + 1}', style: context.textStyleT14r)),
                          Gap.w8,
                          _PlayerItem(playerInfo: player[index], isPitcher: player[index].isPitcher),
                        ],
                      ),
                    ],
                  ),
                );
              });
        });
  }
}

class _PlayerItem extends StatelessWidget {
  const _PlayerItem({required this.playerInfo, required this.isPitcher});

  final PlayerModel playerInfo;
  final bool isPitcher;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isPitcher) {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return DefaultBottomSheet(
                    maxHeight: context.sizeHeight * 0.8,
                    minHeight: context.sizeHeight * 0.5,
                    child: PitcherStatPage(playerInfo: playerInfo));
              });
        } else {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return DefaultBottomSheet(
                    maxHeight: context.sizeHeight * 0.8,
                    minHeight: context.sizeHeight * 0.5,
                    child: BatterStatPage(playerInfo: playerInfo));
              });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(playerInfo.name, style: context.textStyleT16b.copyWith(color: context.colorN20)),
            Gap.w4,
            Text(playerInfo.team.name, style: context.textStyleB12r.copyWith(color: context.colorN20)),
            // Text(playerInfo.owner)
          ],
        ),
      ),
    );
  }
}

class _ScoreBoard extends StatefulWidget {
  @override
  State<_ScoreBoard> createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<_ScoreBoard> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool tap = false;

  @override
  void initState() {
    controller = AnimationController(vsync: this, value: 1);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.colorP10, width: 2),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedSwitcher(
          duration: DurationConst.ms300,
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
          child: tap == true
              ? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('실시간 스코어', style: context.textStyleT12b.copyWith(color: context.colorP10)),
                        IconButton(
                            onPressed: () => setState(() {
                                  tap = !tap;
                                }),
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
                        Text('실시간 스코어', style: context.textStyleT12b.copyWith(color: context.colorP10)),
                        IconButton(
                            onPressed: () => setState(() {
                                  tap = !tap;
                                }),
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
    );
  }
}

class _ScoreView extends StatelessWidget {
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
            Expanded(child: Center(child: Text('소크라테스'))),
            Spacer(flex: 3),
            Expanded(child: Center(child: Text('소크라테스'))),
          ],
        )
      ],
    );
  }
}

class _TradeBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.colorP10, width: 2),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('트레이드', style: context.textStyleT12b.copyWith(color: context.colorP10)),
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
    );
  }
}
