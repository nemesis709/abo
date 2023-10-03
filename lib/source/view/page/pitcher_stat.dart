import 'package:abo/common/common_constants.dart';
import 'package:abo/common/extension/build_context_extension.dart';
import 'package:abo/common/loadable_content.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/view/controller/batter_stat_controller.dart';
import 'package:abo/source/view/controller/pitcher_stat_controller.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class PitcherStatPage extends HookConsumerWidget {
  const PitcherStatPage({
    super.key,
    required this.playerInfo,
  });

  final PlayerModel playerInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LoadableContent(
        asyncValue: ref.watch(pitcherStatControllerProvider(playerInfo)),
        content: (asyncValue) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(playerInfo.name,
                      style: context.textStyleH20b
                          .copyWith(color: context.colorP10)),
                  Gap.w4,
                  Text(playerInfo.team),
                  const Spacer(),
                  const Icon(Icons.star_border, size: 24),
                ],
              ),
              Text('No.${playerInfo.backNumber}'),
              // Text(playerInfo.birthDate),
              Text(playerInfo.spec),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(playerInfo.position),
                  const Text('('),
                  Text(playerInfo.throwHand),
                  const Text(','),
                  Text(playerInfo.batHand),
                  const Text(')'),
                ],
              ),
              Gap.h32,
              Text('2023 시즌',
                  style:
                      context.textStyleT14r.copyWith(color: context.colorP10)),
              const Row(
                children: [],
              ),
              Container(
                color: context.colorN80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: const Center(child: Text('G'))),
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: const Center(child: Text('이닝'))),
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: const Center(child: Text('ERA'))),
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: const Center(child: Text('FIP'))),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      width: (context.sizeWidth - 64) / 4,
                      child: Center(child: Text(asyncValue.game.toString()))),
                  SizedBox(
                    width: (context.sizeWidth - 64) / 4,
                    child: Center(child: Text(asyncValue.inning.toString())),
                  ),
                  SizedBox(
                      width: (context.sizeWidth - 64) / 4,
                      child: Center(child: Text(asyncValue.era.toString()))),
                  SizedBox(
                    width: (context.sizeWidth - 64) / 4,
                    child: Center(child: Text(asyncValue.fip.toString())),
                  ),
                ],
              ),
              Container(
                color: context.colorN80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: const Center(child: Text('W'))),
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: const Center(child: Text('L'))),
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: const Center(child: Text('SV'))),
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: const Center(child: Text('HLD'))),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      width: (context.sizeWidth - 64) / 4,
                      child: Center(child: Text(asyncValue.win.toString()))),
                  SizedBox(
                      width: (context.sizeWidth - 64) / 4,
                      child: Center(child: Text(asyncValue.lost.toString()))),
                  SizedBox(
                      width: (context.sizeWidth - 64) / 4,
                      child: Center(child: Text(asyncValue.save.toString()))),
                  SizedBox(
                      width: (context.sizeWidth - 64) / 4,
                      child: Center(child: Text(asyncValue.hold.toString()))),
                ],
              ),
              Container(
                color: context.colorN80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: const Center(child: Text('WAR'))),
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: const Center(child: Text('K/9'))),
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: const Center(child: Text('BB/9'))),
                    SizedBox(
                      width: (context.sizeWidth - 64) / 4,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: (context.sizeWidth - 64) / 4,
                    child: Center(
                      child: Text(asyncValue.war.toString()),
                    ),
                  ),
                  SizedBox(
                    width: (context.sizeWidth - 64) / 4,
                    child: Center(
                      child: Text(asyncValue.k9.toString()),
                    ),
                  ),
                  SizedBox(
                    width: (context.sizeWidth - 64) / 4,
                    child: Center(
                      child: Text(asyncValue.bb9.toString()),
                    ),
                  ),
                  SizedBox(
                    width: (context.sizeWidth - 64) / 4,
                  ),
                ],
              ),
            ],
          );
        });
  }
}
