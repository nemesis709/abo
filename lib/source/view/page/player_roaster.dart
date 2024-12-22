import 'package:abo/common/common_constants.dart';
import 'package:abo/common/extension/build_context_extension.dart';
import 'package:abo/common/loadable_content.dart';
import 'package:abo/source/controller/lineup_controller.dart';
import 'package:abo/source/controller/roaster_controller.dart';
import 'package:abo/source/domain/lineup_model.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/view/widget/default_bottom_sheet.dart';
import 'package:abo/source/view/widget/stats/batter_stat.dart';
import 'package:abo/source/view/widget/stats/pitcher_stat.dart';
import 'package:abo/ui/route/app_router.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class PlayerRoasterPage extends ConsumerStatefulWidget {
  const PlayerRoasterPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayerRoasterPageState();
}

class _PlayerRoasterPageState extends ConsumerState<PlayerRoasterPage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final lineupNotifier = ref.read(lineupControllerProvider.notifier);

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            '선수 현황',
            style: context.textStyleB18b.copyWith(color: context.colorP10),
          ),
          actions: [
            InkWell(
              onTap: () => context.pushRoute(PlayerListRoute()),
              child: Icon(Icons.search),
            ),
            Gap.w16,
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: LoadableContent(
              asyncValue: ref.watch(roasterControllerProvider),
              content: (playerList) {
                if (playerList.isEmpty) {
                  return Center(
                    child: Text(
                      '선수 명단이 없습니다.',
                      style: context.textStyleT14b,
                    ),
                  );
                }

                return Column(
                  children: [
                    TabBar(
                      controller: tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: [
                        Tab(text: '감독'),
                        Tab(text: '라인업'),
                        Tab(text: '선수 명단'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          Column(
                            children: [
                              Text('감독'),
                            ],
                          ),
                          LoadableContent(
                              asyncValue: ref.watch(lineupControllerProvider),
                              content: (lineup) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Gap.h16,
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          _Lineup(
                                            playerList: playerList,
                                            lineup: lineup,
                                            onChanged: (player, position) =>
                                                lineupNotifier.updateLineup(player: player, position: position),
                                          ),
                                          _Rotation(
                                            playerList: playerList,
                                            lineup: lineup,
                                            onChanged: (player, position) {
                                              if (position == 'SP') {
                                                lineupNotifier.updateStartPitcher(player: player);
                                              } else if (position == 'RP1') {
                                                lineupNotifier.updateReliefPitcher1(player: player);
                                              } else if (position == 'RP2') {
                                                lineupNotifier.updateReliefPitcher2(player: player);
                                              } else if (position == 'SU') {
                                                lineupNotifier.updateSetupPitcher(player: player);
                                              } else if (position == 'CP') {
                                                lineupNotifier.updateClosePitcher(player: player);
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Gap.h24,
                                    FilledButton(
                                      onPressed: () async {
                                        lineupNotifier.setLineUp();
                                      },
                                      child: Text('라인업 제출'),
                                    ),
                                    Gap.h16,
                                    Text('권장 포지션대로 라인업에 등록한 경우\n50%의 보너스 포인트를 얻을 수 있습니다', textAlign: TextAlign.center),
                                    Gap.h16,
                                  ],
                                );
                              }),
                          SingleChildScrollView(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Gap.h16,
                                    Text(
                                      '투수 ${playerList.where((e) => e.isPitcher).length}명',
                                      style: context.textStyleT16b.copyWith(color: context.colorN20),
                                    ),
                                    Gap.h16,
                                    ...playerList.where((e) => e.isPitcher).map((e) => _PlayerItem(
                                          playerModel: e,
                                          showBaseline: true,
                                          onTap: () {
                                            showModalBottomSheet(
                                                isScrollControlled: true,
                                                context: context,
                                                builder: (context) {
                                                  return DefaultBottomSheet(
                                                      maxHeight: context.sizeHeight * 0.8,
                                                      minHeight: context.sizeHeight * 0.2,
                                                      child: PitcherStat(playerModel: e));
                                                });
                                          },
                                        )),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Gap.h16,
                                    Text(
                                      '타자 ${playerList.where((e) => !e.isPitcher).length}명',
                                      style: context.textStyleT16b.copyWith(color: context.colorN20),
                                    ),
                                    Gap.h16,
                                    ...playerList.where((e) => !e.isPitcher).map((e) => _PlayerItem(
                                          playerModel: e,
                                          showBaseline: true,
                                          onTap: () {
                                            showModalBottomSheet(
                                                isScrollControlled: true,
                                                context: context,
                                                builder: (context) {
                                                  return DefaultBottomSheet(
                                                      maxHeight: context.sizeHeight * 0.8,
                                                      minHeight: context.sizeHeight * 0.2,
                                                      child: BatterStat(playerModel: e));
                                                });
                                          },
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ));
  }
}

class _Lineup extends StatefulWidget {
  const _Lineup({
    required this.playerList,
    required this.lineup,
    required this.onChanged,
  });

  final List<PlayerModel> playerList;
  final LineupModel lineup;
  final Function(PlayerModel?, Position) onChanged;

  @override
  State<_Lineup> createState() => _LineupState();
}

class _LineupState extends State<_Lineup> {
  Future<PlayerModel?> showPlayerBottom({
    required Iterable<PlayerModel> match,
    required Iterable<PlayerModel> notMatch,
  }) async {
    List<PlayerModel> players = [];

    players.addAll(match);
    players.addAll(notMatch);

    if (players.isNotEmpty) {
      PlayerModel? player = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return DefaultBottomSheet(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (match.isNotEmpty) ...[
                  Text('권장선수', style: context.textStyleT14m),
                  Divider(),
                  ...match.map((e) => _PlayerItem(playerModel: e, onTap: () => context.maybePop(e))),
                ],
                if (match.isNotEmpty && notMatch.isNotEmpty) Gap.h16,
                if (notMatch.isNotEmpty) ...[
                  Text('기타선수', style: context.textStyleT14m),
                  Divider(),
                  ...notMatch.map((e) => _PlayerItem(playerModel: e, onTap: () => context.maybePop(e))),
                ],
              ],
            ),
          );
        },
      );

      return player;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Position(
          onTap: () async {
            final match = widget.playerList.where((e) => e.position == Position.catcher);

            final notMatch =
                widget.playerList.where((e) => e.position != Position.catcher && e.position != Position.pitcher);

            final player = await showPlayerBottom(match: match, notMatch: notMatch);
            widget.onChanged.call(player, Position.catcher);
          },
          position: Position.catcher.displayString,
          playerModel: widget.lineup.catcher,
        ),
        _Position(
          onTap: () async {
            final match = widget.playerList.where((e) => e.position == Position.firstBase);
            final notMatch =
                widget.playerList.where((e) => e.position != Position.firstBase && e.position != Position.pitcher);

            final player = await showPlayerBottom(match: match, notMatch: notMatch);
            widget.onChanged.call(player, Position.firstBase);
          },
          position: Position.firstBase.displayString,
          playerModel: widget.lineup.firstBase,
        ),
        _Position(
          onTap: () async {
            final match = widget.playerList.where((e) => e.position == Position.secondBase);
            final notMatch =
                widget.playerList.where((e) => e.position != Position.secondBase && e.position != Position.pitcher);

            final player = await showPlayerBottom(match: match, notMatch: notMatch);
            widget.onChanged.call(player, Position.secondBase);
          },
          position: Position.secondBase.displayString,
          playerModel: widget.lineup.secondBase,
        ),
        _Position(
          onTap: () async {
            final match = widget.playerList.where((e) => e.position == Position.thirdBase);
            final notMatch =
                widget.playerList.where((e) => e.position != Position.thirdBase && e.position != Position.pitcher);

            final player = await showPlayerBottom(match: match, notMatch: notMatch);
            widget.onChanged.call(player, Position.thirdBase);
          },
          position: Position.thirdBase.displayString,
          playerModel: widget.lineup.thirdBase,
        ),
        _Position(
          onTap: () async {
            final match = widget.playerList.where((e) => e.position == Position.shortStop);
            final notMatch =
                widget.playerList.where((e) => e.position != Position.shortStop && e.position != Position.pitcher);

            final player = await showPlayerBottom(match: match, notMatch: notMatch);
            widget.onChanged.call(player, Position.shortStop);
          },
          position: Position.shortStop.displayString,
          playerModel: widget.lineup.shortStop,
        ),
        _Position(
          onTap: () async {
            final match = widget.playerList.where((e) => e.position.isOutfield);
            final notMatch = widget.playerList.where((e) => !e.position.isOutfield && e.position != Position.pitcher);

            final player = await showPlayerBottom(match: match, notMatch: notMatch);
            widget.onChanged.call(player, Position.leftField);
          },
          position: Position.leftField.displayString,
          playerModel: widget.lineup.leftField,
        ),
        _Position(
          onTap: () async {
            final match = widget.playerList.where((e) => e.position.isOutfield);
            final notMatch = widget.playerList.where((e) => !e.position.isOutfield && e.position != Position.pitcher);

            final player = await showPlayerBottom(match: match, notMatch: notMatch);
            widget.onChanged.call(player, Position.centerField);
          },
          position: Position.centerField.displayString,
          playerModel: widget.lineup.centerField,
        ),
        _Position(
          onTap: () async {
            final match = widget.playerList.where((e) => e.position.isOutfield);
            final notMatch = widget.playerList.where((e) => !e.position.isOutfield && e.position != Position.pitcher);

            final player = await showPlayerBottom(match: match, notMatch: notMatch);
            widget.onChanged.call(player, Position.rightField);
          },
          position: Position.rightField.displayString,
          playerModel: widget.lineup.rightField,
        ),
        _Position(
          onTap: () async {
            final match = widget.playerList.where((e) => e.position != Position.pitcher);
            final notMatch = <PlayerModel>[];

            final player = await showPlayerBottom(match: match, notMatch: notMatch);
            widget.onChanged.call(player, Position.designated);
          },
          position: Position.designated.displayString,
          playerModel: widget.lineup.designated,
        ),
      ],
    );
  }
}

class _Rotation extends StatelessWidget {
  const _Rotation({
    required this.playerList,
    required this.lineup,
    required this.onChanged,
  });

  final List<PlayerModel> playerList;
  final LineupModel lineup;
  final Function(PlayerModel?, String) onChanged;

  @override
  Widget build(BuildContext context) {
    Future<PlayerModel?> showPlayerBottom({
      required Iterable<PlayerModel> match,
      required Iterable<PlayerModel> notMatch,
    }) async {
      List<PlayerModel> players = [];

      players.addAll(match);
      players.addAll(notMatch);

      if (players.isNotEmpty) {
        PlayerModel? player = await showModalBottomSheet(
          context: context,
          builder: (context) {
            return DefaultBottomSheet(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (match.isNotEmpty) ...[
                    Text('권장선수', style: context.textStyleT14m),
                    Divider(),
                    ...match.map((e) => _PlayerItem(playerModel: e, onTap: () => context.maybePop(e))),
                  ],
                  if (match.isNotEmpty && notMatch.isNotEmpty) Gap.h16,
                  if (notMatch.isNotEmpty) ...[
                    Text('기타선수', style: context.textStyleT14m),
                    Divider(),
                    ...notMatch.map((e) => _PlayerItem(playerModel: e, onTap: () => context.maybePop(e))),
                  ],
                ],
              ),
            );
          },
        );

        return player;
      } else {
        return null;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Position(
          onTap: () async {
            final match = playerList.where((e) => e.position == Position.pitcher);
            final notMatch = <PlayerModel>[];

            final player = await showPlayerBottom(match: match, notMatch: notMatch);
            onChanged.call(player, 'SP');
          },
          position: 'SP',
          playerModel: lineup.startPitcher,
        ),
        _Position(
          onTap: () async {
            final match = playerList.where((e) => e.position == Position.pitcher);
            final notMatch = <PlayerModel>[];

            final player = await showPlayerBottom(match: match, notMatch: notMatch);
            onChanged.call(player, 'RP1');
          },
          position: 'RP',
          playerModel: lineup.reliefPitcher1,
        ),
        _Position(
          onTap: () async {
            final match = playerList.where((e) => e.position == Position.pitcher);
            final notMatch = <PlayerModel>[];

            final player = await showPlayerBottom(match: match, notMatch: notMatch);
            onChanged.call(player, 'RP2');
          },
          position: 'RP',
          playerModel: lineup.reliefPitcher2,
        ),
        _Position(
          onTap: () async {
            final match = playerList.where((e) => e.position == Position.pitcher);
            final notMatch = <PlayerModel>[];

            final player = await showPlayerBottom(match: match, notMatch: notMatch);
            onChanged.call(player, 'SU');
          },
          position: 'SU',
          playerModel: lineup.setupPitcher,
        ),
        _Position(
          onTap: () async {
            final match = playerList.where((e) => e.position == Position.pitcher);
            final notMatch = <PlayerModel>[];

            final player = await showPlayerBottom(match: match, notMatch: notMatch);
            onChanged.call(player, 'CP');
          },
          position: 'CP',
          playerModel: lineup.closingPitcher,
        ),
      ],
    );
  }
}

class _Position extends StatelessWidget {
  const _Position({
    required this.onTap,
    required this.position,
    this.playerModel,
  });

  final VoidCallback onTap;
  final String position;
  final PlayerModel? playerModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 24, child: Text(position)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 120,
              child: playerModel == null
                  ? Text(
                      '선택해주세요',
                      style: context.textStyleT16b.copyWith(color: context.colorN80),
                    )
                  : Text(playerModel!.name, style: context.textStyleT16b.copyWith(color: context.colorN20)),
            ),
          )
        ],
      ),
    );
  }
}

class _PlayerItem extends StatelessWidget {
  const _PlayerItem({
    required this.playerModel,
    this.onTap,
    this.showBaseline,
  });

  final PlayerModel playerModel;
  final VoidCallback? onTap;
  final bool? showBaseline;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 120,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                playerModel.name,
                style: context.textStyleT16b.copyWith(color: context.colorN20).copyWith(
                      decoration: showBaseline == true ? TextDecoration.underline : null,
                    ),
              ),
              Gap.w4,
              Text(playerModel.position.displayString),
              // Text(playerModel.owner)
            ],
          ),
        ),
      ),
    );
  }
}
