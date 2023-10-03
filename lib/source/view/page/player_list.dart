import 'package:abo/common/common_constants.dart';
import 'package:abo/common/listenable_listener_hook.dart';
import 'package:abo/common/loadable_content.dart';
import 'package:abo/source/domain/player_info.dart';
import 'package:abo/source/view/controller/player_controller.dart';
import 'package:abo/source/view/page/player.dart';
import 'package:abo/ui/route/app_router.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class PlayerListPage extends HookConsumerWidget {
  const PlayerListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTabController(initialLength: 2);

    final pitcher = ref.watch(playerControllerProvider(true));
    final batter = ref.watch(playerControllerProvider(false));

    useListenableListener(controller, () {
      if (controller.index == 0) {
        ref.invalidate(playerControllerProvider(false));
      } else {
        ref.invalidate(playerControllerProvider(true));
      }
    });

    return Scaffold(
        appBar: AppBar(
          title: Text(
            '랭킹 보기',
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
                                  .map((e) => _PlayerItem(playerInfo: e))
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
                                  .map((e) => _PlayerItem(playerInfo: e))
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

class _PlayerItem extends HookWidget {
  const _PlayerItem({required this.playerInfo});

  final PlayerInfo playerInfo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushRoute(PlayerRoute(playerInfo: playerInfo)),
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
