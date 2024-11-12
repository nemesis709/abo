import 'package:abo/common/common_constants.dart';
import 'package:abo/common/extension/build_context_extension.dart';
import 'package:abo/common/loadable_content.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/view/controller/player_controller.dart';
import 'package:abo/source/view/page/batter_stat.dart';
import 'package:abo/source/view/page/pitcher_stat.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:abo/ui/widget/default_bottom_sheet.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class PlayerListPage extends ConsumerStatefulWidget {
  const PlayerListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayerListPageState();

}

class _PlayerListPageState extends ConsumerState<PlayerListPage> with SingleTickerProviderStateMixin {

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
    final pitcher = ref.watch(playerControllerProvider(true));
    final batter = ref.watch(playerControllerProvider(false));

    return Scaffold(
        appBar: AppBar(
          title: Text(
            '선수 명단',
            style: context.textStyleH20b.copyWith(color: context.colorP10),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(controller: controller, tabs: [
                Text('투수',
                    style: context.textStyleT14b
                        .copyWith(color: context.colorP10)),
                Text('타자',
                    style: context.textStyleT14b
                        .copyWith(color: context.colorP10)),
              ]),
              Gap.h16,
              Expanded(
                child: TabBarView(
                  controller: controller,
                  children: [
                    LoadableContent(
                        asyncValue: pitcher,
                        content: (content) {
                          return SingleChildScrollView(
                            child: Column(
                              children: content
                                  .map((e) => _PlayerItem(
                                        playerInfo: e,
                                        isPitcher: true,
                                      ))
                                  .toList(),
                            ),
                          );
                        }),
                    LoadableContent(
                        asyncValue: batter,
                        content: (content) {
                          return SingleChildScrollView(
                            child: Column(
                              children: content
                                  .map((e) => _PlayerItem(
                                        playerInfo: e,
                                        isPitcher: false,
                                      ))
                                  .toList(),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ));
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
            builder: (context)
          {
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
            Text(playerInfo.name,
                style: context.textStyleT16b.copyWith(color: context.colorN20)),
            Gap.w4,
            Text(playerInfo.team,
                style: context.textStyleB12r.copyWith(color: context.colorN20)),
            const Spacer(),
            const Icon(Icons.account_box_rounded, size: 14),
            Gap.w4,
            Text('김범진', style: context.textStyleT14r),
            // Text(playerInfo.owner)
          ],
        ),
      ),
    );
  }
}
