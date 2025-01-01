import 'package:abo/common/common_constants.dart';
import 'package:abo/common/extension/build_context_extension.dart';
import 'package:abo/common/loadable_content.dart';
import 'package:abo/source/controller/calendar_controller.dart';
import 'package:abo/source/domain/game_model.dart';
import 'package:abo/source/domain/lineup_model.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/view/widget/default_bottom_sheet.dart';
import 'package:abo/source/view/widget/stats/batter_daily_stat.dart';
import 'package:abo/source/view/widget/stats/empty_daily_stat.dart';
import 'package:abo/source/view/widget/stats/pitcher_daily_stat.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScoreView extends ConsumerStatefulWidget {
  const ScoreView({
    super.key,
    required this.dateTime,
    this.onMainTap,
  });

  final DateTime dateTime;
  final VoidCallback? onMainTap;

  @override
  ConsumerState<ScoreView> createState() => _ScoreViewState();
}

class _ScoreViewState extends ConsumerState<ScoreView> with SingleTickerProviderStateMixin {
  GameModel? gameModel;

  @override
  void didUpdateWidget(covariant ScoreView oldWidget) {
    setState(() {
      gameModel = null;
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onMainTap != null) {
      return LoadableContent(
          asyncValue: ref.watch(calendarControllerProvider(dateTime: widget.dateTime)),
          content: (asyncValue) {
            if (asyncValue.isEmpty) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '오늘의 경기가 없습니다.',
                  style: context.textStyleT14b,
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...asyncValue.map((e) {
                    return _ScoreView(e, onTap: () => widget.onMainTap?.call());
                  }),
                ],
              ),
            );
          });
    }
    return Expanded(
      child: LoadableContent(
          asyncValue: ref.watch(calendarControllerProvider(dateTime: widget.dateTime)),
          content: (asyncValue) {
            if (asyncValue.isEmpty) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '오늘의 경기가 없습니다.',
                  style: context.textStyleT14b,
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap.h4,
                  ...asyncValue.map((e) {
                    return _ScoreView(e, selectedModel: gameModel, onTap: () {
                      setState(() {
                        gameModel = gameModel?.gameId == e.gameId ? null : e;
                      });
                    });
                  }),
                  Gap.h4,
                  Divider(color: context.colorP10),
                  if (gameModel != null) ...[
                    _GameInfo(gameModel: gameModel!),
                  ],
                ],
              ),
            );
          }),
    );
  }
}

class _ScoreView extends StatelessWidget {
  const _ScoreView(
    this.gameModel, {
    this.selectedModel,
    required this.onTap,
  });

  final GameModel gameModel;
  final GameModel? selectedModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap.call(),
      child: Container(
        color: (gameModel == selectedModel) ? context.colorP10.withOpacity(0.05) : context.colorN100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap.h4,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.ideographic,
              children: [
                SizedBox(
                  width: 60,
                  child: Center(
                    child: Text(
                      gameModel.away.user.name,
                      style: context.textStyleT14b,
                    ),
                  ),
                ),
                if (gameModel.home.score != null && gameModel.away.score != null) ...[
                  SizedBox(
                    width: 20,
                    child: Center(
                      child: (gameModel.home.score! < gameModel.away.score!)
                          ? Text(
                              'W',
                              style: context.textStyleT12b.copyWith(color: context.colorVermillion),
                            )
                          : Text(''),
                    ),
                  ),
                  SizedBox(width: 60, child: Center(child: Text('${gameModel.away.score} P'))),
                ] else ...[
                  SizedBox(width: 20),
                  SizedBox(width: 60),
                ],
                Center(child: Text(gameModel.canceled == true ? '우천취소' : 'vs', style: context.textStyleT14r)),
                if (gameModel.home.score != null && gameModel.away.score != null) ...[
                  SizedBox(width: 60, child: Center(child: Text('${gameModel.home.score} P'))),
                  SizedBox(
                    width: 20,
                    child: Center(
                      child: (gameModel.home.score! > gameModel.away.score!)
                          ? Text(
                              'W',
                              style: context.textStyleT12b.copyWith(color: context.colorVermillion),
                            )
                          : Text(''),
                    ),
                  ),
                ] else ...[
                  SizedBox(width: 20),
                  SizedBox(width: 60),
                ],
                SizedBox(
                  width: 60,
                  child: Center(
                    child: Text(
                      gameModel.home.user.name,
                      style: context.textStyleT14b,
                    ),
                  ),
                ),
                Icon(Icons.search, size: 16, color: context.colorN60),
              ],
            ),
            Gap.h4,
          ],
        ),
      ),
    );
  }
}

class _GameInfo extends StatelessWidget {
  const _GameInfo({
    required this.gameModel,
  });

  final GameModel gameModel;

  @override
  Widget build(BuildContext context) {
    final homeLineup = gameModel.home.lineup;
    final homeBench = List.from(gameModel.home.bench)
      ..sort((a, b) {
        if (a.pitcherDailyStatModel == null && b.pitcherDailyStatModel != null) return 1; // a가 null이면 뒤로
        if (a.pitcherDailyStatModel != null && b.pitcherDailyStatModel == null) return -1; // b가 null이면 앞으로
        return 0; // 둘 다 null이 아니면 그대로
      })
      ..sort((a, b) {
        if (a.batterDailyStatModel == null && b.batterDailyStatModel != null) return 1; // a가 null이면 뒤로
        if (a.batterDailyStatModel != null && b.batterDailyStatModel == null) return -1; // b가 null이면 앞으로
        return 0; // 둘 다 null이 아니면 그대로
      });
    final awayLineup = gameModel.away.lineup;
    final awayBench = List<PlayerModel>.from(gameModel.away.bench)
      ..sort((a, b) {
        if (a.pitcherDailyStatModel == null && b.pitcherDailyStatModel != null) return 1; // a가 null이면 뒤로
        if (a.pitcherDailyStatModel != null && b.pitcherDailyStatModel == null) return -1; // b가 null이면 앞으로
        return 0; // 둘 다 null이 아니면 그대로
      })
      ..sort((a, b) {
        if (a.batterDailyStatModel == null && b.batterDailyStatModel != null) return 1; // a가 null이면 뒤로
        if (a.batterDailyStatModel != null && b.batterDailyStatModel == null) return -1; // b가 null이면 앞으로
        return 0; // 둘 다 null이 아니면 그대로
      });

    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverMainAxisGroup(slivers: [
            _buildSectionHeader('감독', context),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 32,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: context.sizeWidth / 2 - 32,
                          child: Center(
                            child: Text(
                              gameModel.away.manager.name,
                              style: context.textStyleT14b,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: context.sizeWidth / 2 - 32,
                          child: Center(
                            child: Text(
                              gameModel.home.manager.name,
                              style: context.textStyleT14b,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: context.colorP10),
                ],
              ),
            ),
          ]),
          SliverMainAxisGroup(
            slivers: [
              _buildSectionHeader('선발 라인업', context),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: context.sizeWidth / 2 - 32,
                          child: _Lineup(lineupModel: awayLineup),
                        ),
                        SizedBox(
                          width: context.sizeWidth / 2 - 32,
                          child: _Lineup(lineupModel: homeLineup),
                        ),
                      ],
                    ),
                    Divider(color: context.colorP10),
                  ],
                ),
              ),
            ],
          ),
          SliverMainAxisGroup(
            slivers: [
              _buildSectionHeader('벤치 명단', context),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: context.sizeWidth / 2 - 32,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: awayBench.map((e) => _Player(playerModel: e)).toList(),
                          ),
                        ),
                        SizedBox(
                          width: context.sizeWidth / 2 - 32,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: homeBench.map((e) => _Player(playerModel: e)).toList(),
                          ),
                        ),
                      ],
                    ),
                    Divider(color: context.colorP10),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Lineup extends StatelessWidget {
  const _Lineup({
    required this.lineupModel,
  });
  final LineupModel lineupModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Player(playerModel: lineupModel.catcher!),
        _Player(playerModel: lineupModel.firstBase!),
        _Player(playerModel: lineupModel.secondBase!),
        _Player(playerModel: lineupModel.thirdBase!),
        _Player(playerModel: lineupModel.shortStop!),
        _Player(playerModel: lineupModel.leftField!),
        _Player(playerModel: lineupModel.centerField!),
        _Player(playerModel: lineupModel.rightField!),
        _Player(playerModel: lineupModel.designated!),
        _Player(playerModel: lineupModel.startPitcher!),
        _Player(playerModel: lineupModel.reliefPitcher1!),
        _Player(playerModel: lineupModel.reliefPitcher2!),
        _Player(playerModel: lineupModel.setupPitcher!),
        _Player(playerModel: lineupModel.closingPitcher!),
      ],
    );
  }
}

class _Player extends StatelessWidget {
  const _Player({
    required this.playerModel,
  });

  final PlayerModel playerModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (playerModel.pitcherDailyStatModel != null) {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return DefaultBottomSheet(
                    maxHeight: context.sizeHeight * 0.8,
                    minHeight: context.sizeHeight * 0.3,
                    child: PitcherDailyStat(playerModel: playerModel));
              });
        } else if (playerModel.batterDailyStatModel != null) {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return DefaultBottomSheet(
                    maxHeight: context.sizeHeight * 0.8,
                    minHeight: context.sizeHeight * 0.3,
                    child: BatterDailyStat(playerModel: playerModel));
              });
        } else {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return DefaultBottomSheet(
                    maxHeight: context.sizeHeight * 0.8,
                    minHeight: context.sizeHeight * 0.3,
                    child: EmptyDailyStat(playerModel: playerModel));
              });
        }
      },
      child: SizedBox(
        width: 140,
        height: 32,
        child: Row(
          children: [
            SizedBox(width: 24, child: Text(playerModel.lineupPosition ?? '')),
            Text(
              playerModel.name,
              style: playerModel.hasDailyStat
                  ? context.textStyleT14b.copyWith(color: context.colorN10, decoration: TextDecoration.underline)
                  : context.textStyleT14b.copyWith(color: context.colorN60),
            ),
            Gap.w4,
            Spacer(),
            Text(
              '${playerModel.dailyPoint} P',
              style: context.textStyleT14r,
            ),
          ],
        ),
      ),
    );
  }
}

// 섹션 헤더 빌드 함수
SliverPersistentHeader _buildSectionHeader(String title, BuildContext context) {
  return SliverPersistentHeader(
    pinned: true, // 스크롤 시 상단 고정
    delegate: _HeaderDelegate(
      height: 40,
      child: Container(
        color: context.colorN100,
        alignment: Alignment.center,
        child: Column(
          children: [
            Divider(color: context.colorP10),
            Spacer(),
            Text(
              title,
              style: context.textStyleB14b.copyWith(color: context.colorP10),
            ),
            Spacer(),
            Divider(color: context.colorP10),
          ],
        ),
      ),
    ),
  );
}

// PersistentHeader의 크기와 내용 설정
class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  final double height;
  final Widget child;

  _HeaderDelegate({
    required this.height,
    required this.child,
  });

  @override
  double get minExtent => height;
  @override
  double get maxExtent => height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(covariant _HeaderDelegate oldDelegate) {
    return oldDelegate.height != height || oldDelegate.child != child;
  }
}
