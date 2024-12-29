import 'package:abo/common/common_constants.dart';
import 'package:abo/common/extension/build_context_extension.dart';
import 'package:abo/common/loadable_content.dart';
import 'package:abo/source/controller/calendar_controller.dart';
import 'package:abo/source/domain/game_model.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/view/widget/default_bottom_sheet.dart';
import 'package:abo/source/view/widget/stats/batter_daily_stat.dart';
import 'package:abo/source/view/widget/stats/empty_daily_stat.dart';
import 'package:abo/source/view/widget/stats/pitcher_daily_stat.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:collection/collection.dart';
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
                Center(child: Text('vs', style: context.textStyleT14r)),
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
    final homePlayers = gameModel.home.players;
    final homeBench = homePlayers.where((e) => e.positionNumber == null).toList();
    final awayPlayers = gameModel.away.players;
    final awayBench = awayPlayers.where((e) => e.positionNumber == null).toList();

    return Expanded(
      child: CustomScrollView(
        slivers: [
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              for (int i = 2; i <= 15; i++) _PlayerModel(players: awayPlayers, positionNumber: i),
                            ],
                            // awayLineup.map((e) => _PlayerModel(e)).toList(),
                          ),
                        ),
                        SizedBox(
                          width: context.sizeWidth / 2 - 32,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (int i = 2; i <= 15; i++) _PlayerModel(players: homePlayers, positionNumber: i),
                            ],
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
                            children: awayBench.map((e) => _PlayerModel(playerModel: e)).toList(),
                          ),
                        ),
                        SizedBox(
                          width: context.sizeWidth / 2 - 32,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: homeBench.map((e) => _PlayerModel(playerModel: e)).toList(),
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

class _PlayerModel extends StatelessWidget {
  const _PlayerModel({
    this.players = const [],
    this.playerModel,
    this.positionNumber,
  });

  final List<PlayerModel> players;
  final PlayerModel? playerModel;
  final int? positionNumber;
  @override
  Widget build(BuildContext context) {
    final player = playerModel ?? players.firstWhereOrNull((e) => e.positionNumber == positionNumber);
    if (player == null) {
      return SizedBox(
        width: 140,
        height: 32,
        child: Row(
          children: [
            if (positionNumber != null) ...[
              SizedBox(width: 24, child: Text(PlayerModel.getLineupPosition(positionNumber!))),
            ],
            Text(
              '-',
              style: context.textStyleT14b.copyWith(color: context.colorN60),
            ),
            Gap.w4,
            Spacer(),
            Text(
              'P',
              style: context.textStyleT14r,
            ),
          ],
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          if (player.pitcherDailyStatModel != null) {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return DefaultBottomSheet(
                      maxHeight: context.sizeHeight * 0.8,
                      minHeight: context.sizeHeight * 0.3,
                      child: PitcherDailyStat(playerModel: player));
                });
          } else if (player.batterDailyStatModel != null) {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return DefaultBottomSheet(
                      maxHeight: context.sizeHeight * 0.8,
                      minHeight: context.sizeHeight * 0.3,
                      child: BatterDailyStat(playerModel: player));
                });
          } else {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return DefaultBottomSheet(
                      maxHeight: context.sizeHeight * 0.8,
                      minHeight: context.sizeHeight * 0.3,
                      child: EmptyDailyStat(playerModel: player));
                });
          }
        },
        child: SizedBox(
          width: 140,
          height: 32,
          child: Row(
            children: [
              SizedBox(width: 24, child: Text(player.lineupPosition ?? '')),
              Text(
                player.name,
                style: player.hasDailyStat
                    ? context.textStyleT14b.copyWith(color: context.colorN10, decoration: TextDecoration.underline)
                    : context.textStyleT14b.copyWith(color: context.colorN60),
              ),
              Gap.w4,
              Spacer(),
              Text(
                '${player.dailyPoint} P',
                style: context.textStyleT14r,
              ),
            ],
          ),
        ),
      );
    }
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
