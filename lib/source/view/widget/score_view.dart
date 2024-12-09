import 'package:abo/common/common_constants.dart';
import 'package:abo/common/loadable_content.dart';
import 'package:abo/source/controller/calendar_controller.dart';
import 'package:abo/source/domain/game_model.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScoreView extends ConsumerStatefulWidget {
  const ScoreView({
    super.key,
    required this.dateTime,
    this.isMain,
  });

  final DateTime dateTime;
  final bool? isMain;

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
    if (widget.isMain == true) {
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
                    return _ScoreView(e, onTap: () {});
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
            textBaseline: TextBaseline.alphabetic,
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
              SizedBox(
                width: 20,
                child: Center(
                  child: (gameModel.home.score < gameModel.away.score)
                      ? Text(
                          'W',
                          style: context.textStyleT12b.copyWith(color: context.colorVermillion),
                        )
                      : Text(''),
                ),
              ),
              SizedBox(width: 60, child: Center(child: Text('${gameModel.away.score} P'))),
              Center(child: Text('vs', style: context.textStyleT14r)),
              SizedBox(width: 60, child: Center(child: Text('${gameModel.home.score} P'))),
              SizedBox(
                width: 20,
                child: Center(
                  child: (gameModel.home.score > gameModel.away.score)
                      ? Text(
                          'W',
                          style: context.textStyleT12b.copyWith(color: context.colorVermillion),
                        )
                      : Text(''),
                ),
              ),
              SizedBox(
                width: 60,
                child: Center(
                  child: Text(
                    gameModel.home.user.name,
                    style: context.textStyleT14b,
                  ),
                ),
              ),
            ],
          ),
          Gap.h8,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...awayPlayers.map(
                        (e) => Text('${e.name} ${e.batterDailyStatModel?.re24 ?? e.pitcherDailyStatModel?.re24} P'))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...homePlayers.map(
                        (e) => Text('${e.name} ${e.batterDailyStatModel?.re24 ?? e.pitcherDailyStatModel?.re24} P'))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
