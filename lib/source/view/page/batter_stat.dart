import 'package:abo/common/common_constants.dart';
import 'package:abo/common/extension/build_context_extension.dart';
import 'package:abo/common/loadable_content.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/view/controller/batter_stat_controller.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class BatterStatPage extends HookConsumerWidget {
  const BatterStatPage({
    super.key,
    required this.playerInfo,
  });

  final PlayerModel playerInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LoadableContent(
        asyncValue: ref.watch(batterStatControllerProvider(playerInfo)),
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
                        child: const Center(child: Text('AVG'))),
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: const Center(child: Text('H'))),
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: const Center(child: Text('HR'))),
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
                    child: Center(child: Text(asyncValue.avg.toString())),
                  ),
                  SizedBox(
                      width: (context.sizeWidth - 64) / 4,
                      child: Center(child: Text(asyncValue.hit.toString()))),
                  SizedBox(
                    width: (context.sizeWidth - 64) / 4,
                    child: Center(child: Text(asyncValue.hr.toString())),
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
                        child: const Center(child: Text('RBI'))),
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: const Center(child: Text('SO'))),
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: const Center(child: Text('BB'))),
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: const Center(child: Text('SB'))),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      width: (context.sizeWidth - 64) / 4,
                      child: Center(child: Text(asyncValue.rbi.toString()))),
                  SizedBox(
                      width: (context.sizeWidth - 64) / 4,
                      child: Center(child: Text(asyncValue.so.toString()))),
                  SizedBox(
                      width: (context.sizeWidth - 64) / 4,
                      child: Center(child: Text(asyncValue.bb.toString()))),
                  SizedBox(
                      width: (context.sizeWidth - 64) / 4,
                      child: Center(child: Text(asyncValue.sb.toString()))),
                ],
              ),
              Container(
                color: context.colorN80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: const Center(child: Text('OBP'))),
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: const Center(child: Text('SLG'))),
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: const Center(child: Text('OPS'))),
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: const Center(child: Text('WAR'))),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      width: (context.sizeWidth - 64) / 4,
                      child: Center(child: Text(asyncValue.obp.toString()))),
                  SizedBox(
                      width: (context.sizeWidth - 64) / 4,
                      child: Center(child: Text(asyncValue.slg.toString()))),
                  SizedBox(
                      width: (context.sizeWidth - 64) / 4,
                      child: Center(child: Text(asyncValue.ops.toString()))),
                  SizedBox(
                      width: (context.sizeWidth - 64) / 4,
                      child: Center(child: Text(asyncValue.war.toString()))),
                ],
              ),
            ],
          );
        });
  }
}
