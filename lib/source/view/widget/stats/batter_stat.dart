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

class BatterStat extends ConsumerWidget {
  const BatterStat({
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
        Center(child: Text('준비중입니다', style: context.textStyleT14b)),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(playerModel.point.toString()))),
        //     SizedBox(
        //       width: (context.sizeWidth - 64) / 4,
        //       child: Center(child: Text(playerModel.pitcherDailyStatModel.toString())),
        //     ),
        //     SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(playerModel.hit.toString()))),
        //     SizedBox(
        //       width: (context.sizeWidth - 64) / 4,
        //       child: Center(child: Text(playerModel.hr.toString())),
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
        Center(child: Text('준비중입니다', style: context.textStyleT14b)),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(playerModel.rbi.toString()))),
        //     SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(playerModel.so.toString()))),
        //     SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(playerModel.bb.toString()))),
        //     SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(playerModel.sb.toString()))),
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
        Center(child: Text('준비중입니다', style: context.textStyleT14b)),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(playerModel.obp.toString()))),
        //     SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(playerModel.slg.toString()))),
        //     SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(playerModel.ops.toString()))),
        //     SizedBox(width: (context.sizeWidth - 64) / 4, child: Center(child: Text(playerModel.war.toString()))),
        //   ],
        // ),
      ],
    );
  }
}
