import 'package:abo/common/common_constants.dart';
import 'package:abo/common/extension/build_context_extension.dart';
import 'package:abo/common/loadable_content.dart';
import 'package:abo/source/controller/calendar_controller.dart';
import 'package:abo/source/domain/game_model.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/view/widget/default_bottom_sheet.dart';
import 'package:abo/source/view/widget/stats/batter_daily_stat.dart';
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
                  ...asyncValue.map((e) {
                    return _ScoreView(e, selectedModel: gameModel, onTap: () {
                      setState(() {
                        gameModel = gameModel?.gameId == e.gameId ? null : e;
                      });
                    });
                  }),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
          Gap.h12,
        ],
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
    final awayPlayers = gameModel.away.players;

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap.h24,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [...awayPlayers.map((e) => _PlayerModel(e))],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [...homePlayers.map((e) => _PlayerModel(e))],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PlayerModel extends StatelessWidget {
  const _PlayerModel(
    this.playerModel,
  );

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
        }
      },
      child: SizedBox(
        width: 140,
        height: 32,
        child: Row(
          children: [
            SizedBox(width: 24, child: Text(playerModel.position.displayString)),
            Text(
              playerModel.name,
              style: context.textStyleT14b.copyWith(decoration: TextDecoration.underline),
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
