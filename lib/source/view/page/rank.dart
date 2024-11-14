import 'dart:math';

import 'package:abo/common/common_constants.dart';
import 'package:abo/common/extension/build_context_extension.dart';
import 'package:abo/common/loadable_content.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/controller/player_controller.dart';
import 'package:abo/source/controller/user_controller.dart';
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
class RankPage extends ConsumerStatefulWidget {
  const RankPage({super.key});

  @override
  ConsumerState<RankPage> createState() => _RankPageState();
}

class _RankPageState extends ConsumerState<RankPage> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(controller: controller, tabs: [
                Text('감독 랭킹', style: context.textStyleT14b.copyWith(color: context.colorP10)),
                Text('선수 랭킹', style: context.textStyleT14b.copyWith(color: context.colorP10)),
              ]),
              Gap.h16,
              Expanded(
                child: TabBarView(
                  controller: controller,
                  children: [
                    _ManagerRank(),
                    _PlayerRank(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class _ManagerRank extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LoadableContent(
        asyncValue: ref.watch(userControllerProvider),
        content: (asyncValue) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: context.textStyleT14r.fontSize! * 2, child: Text('순위', style: context.textStyleT14r)),
                  Gap.w8,
                  Text('감독명', style: context.textStyleT14r),
                ],
              ),
              _DisplayRank(list: asyncValue.map((e) => e.name).toList()),
            ],
          );
        });
  }
}

class _PlayerRank extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LoadableContent(
        asyncValue: ref.watch(playerControllerProvider(null)),
        content: (asyncValue) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: context.textStyleT14r.fontSize! * 2, child: Text('순위', style: context.textStyleT14r)),
                  Gap.w8,
                  Text('선수명', style: context.textStyleT14r),
                ],
              ),
              ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: min(asyncValue.length, 10),
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
                              _PlayerItem(playerInfo: asyncValue[index], isPitcher: asyncValue[index].isPitcher),
                            ],
                          ),
                        ],
                      ),
                    );
                  })
            ],
          );
        });
  }
}

class _DisplayRank extends ConsumerWidget {
  const _DisplayRank({required this.list});

  final List<String> list;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: min(list.length, 10),
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
