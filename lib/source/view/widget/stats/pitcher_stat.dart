import 'package:abo/app_common.dart';
import 'package:abo/common/common_constants.dart';
import 'package:abo/common/extension/build_context_extension.dart';
import 'package:abo/common/extension/datetime_extension.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/domain/team_model.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PitcherStat extends ConsumerWidget {
  const PitcherStat({
    super.key,
    required this.playerModel,
  });

  final PlayerModel playerModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              child: Team.fromID(playerModel.teamId).logo,
            ),
            Gap.w4,
            Text(playerModel.name, style: context.textStyleH20b.copyWith(color: context.colorP10)),
            Gap.w4,
            Text(playerModel.position.displayString, style: context.textStyleT14b.copyWith(color: context.colorN40)),
          ],
        ),
        Text(playerModel.birthDate.displayYyyymmdd(), style: context.textStyleT14m),
        Text(playerModel.hand, style: context.textStyleT14m),
        Gap.h32,
        const Row(
          children: [],
        ),
        Container(
          color: Team.fromID(playerModel.teamId).color,
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
                    '이닝',
                    style: context.textStyleB14r.copyWith(
                      color: context.colorN100,
                    ),
                  ))),
              SizedBox(
                  width: (context.sizeWidth - 64) / 4,
                  child: Center(
                      child: Text(
                    'ERA',
                    style: context.textStyleB14r.copyWith(
                      color: context.colorN100,
                    ),
                  ))),
              SizedBox(
                  width: (context.sizeWidth - 64) / 4,
                  child: Center(
                      child: Text(
                    'FIP',
                    style: context.textStyleB14r.copyWith(
                      color: context.colorN100,
                    ),
                  ))),
            ],
          ),
        ),
        Center(child: Text('준비중입니다', style: context.textStyleT14b)),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(asyncValue.game.toString()))),
        //     SizedBox(
        //       width: (context.sizeWidth - 64) / 4,
        //       child: Center(child: Text(asyncValue.inning.toString())),
        //     ),
        //     SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(asyncValue.era.toString()))),
        //     SizedBox(
        //       width: (context.sizeWidth - 64) / 4,
        //       child: Center(child: Text(asyncValue.fip.toString())),
        //     ),
        //   ],
        // ),
        Container(
          color: Team.fromID(playerModel.teamId).color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                  width: (context.sizeWidth - 64) / 4,
                  child: Center(
                      child: Text(
                    'W',
                    style: context.textStyleB14r.copyWith(
                      color: context.colorN100,
                    ),
                  ))),
              SizedBox(
                  width: (context.sizeWidth - 64) / 4,
                  child: Center(
                      child: Text(
                    'L',
                    style: context.textStyleB14r.copyWith(
                      color: context.colorN100,
                    ),
                  ))),
              SizedBox(
                  width: (context.sizeWidth - 64) / 4,
                  child: Center(
                      child: Text(
                    'SV',
                    style: context.textStyleB14r.copyWith(
                      color: context.colorN100,
                    ),
                  ))),
              SizedBox(
                  width: (context.sizeWidth - 64) / 4,
                  child: Center(
                      child: Text(
                    'HLD',
                    style: context.textStyleB14r.copyWith(
                      color: context.colorN100,
                    ),
                  ))),
            ],
          ),
        ),
        Center(child: Text('준비중입니다', style: context.textStyleT14b)),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(asyncValue.win.toString()))),
        //     SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(asyncValue.lost.toString()))),
        //     SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(asyncValue.save.toString()))),
        //     SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(asyncValue.hold.toString()))),
        //   ],
        // ),
        Container(
          color: Team.fromID(playerModel.teamId).color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                  width: (context.sizeWidth - 64) / 4,
                  child: Center(
                      child: Text(
                    'WAR',
                    style: context.textStyleB14r.copyWith(
                      color: context.colorN100,
                    ),
                  ))),
              SizedBox(
                  width: (context.sizeWidth - 64) / 4,
                  child: Center(
                      child: Text(
                    'K/9',
                    style: context.textStyleB14r.copyWith(
                      color: context.colorN100,
                    ),
                  ))),
              SizedBox(
                  width: (context.sizeWidth - 64) / 4,
                  child: Center(
                      child: Text(
                    'BB/9',
                    style: context.textStyleB14r.copyWith(
                      color: context.colorN100,
                    ),
                  ))),
              SizedBox(
                width: (context.sizeWidth - 64) / 4,
              ),
            ],
          ),
        ),
        Center(child: Text('준비중입니다', style: context.textStyleT14b)),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     SizedBox(
        //       width: (context.sizeWidth - 64) / 4,
        //       child: Center(
        //         child: Text(asyncValue.war.toString()),
        //       ),
        //     ),
        //     SizedBox(
        //       width: (context.sizeWidth - 64) / 4,
        //       child: Center(
        //         child: Text(asyncValue.k9.toString()),
        //       ),
        //     ),
        //     SizedBox(
        //       width: (context.sizeWidth - 64) / 4,
        //       child: Center(
        //         child: Text(asyncValue.bb9.toString()),
        //       ),
        //     ),
        //     SizedBox(
        //       width: (context.sizeWidth - 64) / 4,
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
