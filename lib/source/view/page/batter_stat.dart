import 'package:abo/app_common.dart';
import 'package:abo/common/common_constants.dart';
import 'package:abo/common/extension/build_context_extension.dart';
import 'package:abo/common/extension/datetime_extension.dart';
import 'package:abo/common/loadable_content.dart';
import 'package:abo/source/controller/batter_stat_controller.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/domain/team_model.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class BatterStatPage extends ConsumerWidget {
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Team.fromID(playerInfo.teamId).logo,
                  ),
                  Gap.w4,
                  Text(playerInfo.name, style: context.textStyleH20b.copyWith(color: context.colorP10)),
                  Gap.w4,
                ],
              ),
              Text(playerInfo.birthDate.displayDate()),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(playerInfo.position),
                  Text(playerInfo.hand),
                ],
              ),
              Gap.h32,
              Text('2023 시즌', style: context.textStyleT14r.copyWith(color: context.colorP10)),
              Container(
                color: Team.fromID(playerInfo.teamId).color,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: Center(
                            child: Text(
                          'G',
                          style: context.textStyleB14r.copyWith(
                            color: context.colorN100,
                          ),
                        ))),
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: Center(
                            child: Text(
                          'AVG',
                          style: context.textStyleB14r.copyWith(
                            color: context.colorN100,
                          ),
                        ))),
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: Center(
                            child: Text(
                          'H',
                          style: context.textStyleB14r.copyWith(
                            color: context.colorN100,
                          ),
                        ))),
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: Center(
                            child: Text(
                          'HR',
                          style: context.textStyleB14r.copyWith(
                            color: context.colorN100,
                          ),
                        ))),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(asyncValue.game.toString()))),
                  SizedBox(
                    width: (context.sizeWidth - 64) / 4,
                    child: Center(child: Text(asyncValue.avg.toString())),
                  ),
                  SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(asyncValue.hit.toString()))),
                  SizedBox(
                    width: (context.sizeWidth - 64) / 4,
                    child: Center(child: Text(asyncValue.hr.toString())),
                  ),
                ],
              ),
              Container(
                color: Team.fromID(playerInfo.teamId).color,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: Center(
                            child: Text(
                          'RBI',
                          style: context.textStyleB14r.copyWith(
                            color: context.colorN100,
                          ),
                        ))),
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: Center(
                            child: Text(
                          'SO',
                          style: context.textStyleB14r.copyWith(
                            color: context.colorN100,
                          ),
                        ))),
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: Center(
                            child: Text(
                          'BB',
                          style: context.textStyleB14r.copyWith(
                            color: context.colorN100,
                          ),
                        ))),
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: Center(
                            child: Text(
                          'SB',
                          style: context.textStyleB14r.copyWith(
                            color: context.colorN100,
                          ),
                        ))),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(asyncValue.rbi.toString()))),
                  SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(asyncValue.so.toString()))),
                  SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(asyncValue.bb.toString()))),
                  SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(asyncValue.sb.toString()))),
                ],
              ),
              Container(
                color: Team.fromID(playerInfo.teamId).color,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: Center(
                            child: Text(
                          'OBP',
                          style: context.textStyleB14r.copyWith(
                            color: context.colorN100,
                          ),
                        ))),
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: Center(
                            child: Text(
                          'SLG',
                          style: context.textStyleB14r.copyWith(
                            color: context.colorN100,
                          ),
                        ))),
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: Center(
                            child: Text(
                          'OPS',
                          style: context.textStyleB14r.copyWith(
                            color: context.colorN100,
                          ),
                        ))),
                    SizedBox(
                        width: (context.sizeWidth - 64) / 4,
                        child: Center(
                            child: Text(
                          'WAR',
                          style: context.textStyleB14r.copyWith(
                            color: context.colorN100,
                          ),
                        ))),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(asyncValue.obp.toString()))),
                  SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(asyncValue.slg.toString()))),
                  SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(asyncValue.ops.toString()))),
                  SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(asyncValue.war.toString()))),
                ],
              ),
            ],
          );
        });
  }
}
