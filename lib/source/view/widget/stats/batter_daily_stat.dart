import 'package:abo/app_common.dart';
import 'package:abo/common/common_constants.dart';
import 'package:abo/common/extension/build_context_extension.dart';
import 'package:abo/common/extension/datetime_extension.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/domain/team_model.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:flutter/material.dart';

class BatterDailyStat extends StatelessWidget {
  const BatterDailyStat({
    super.key,
    required this.playerModel,
  });

  final PlayerModel playerModel;
  @override
  Widget build(BuildContext context) {
    final batterInfo = playerModel.batterDailyStatModel;

    if (batterInfo == null) {
      return SizedBox();
    }

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
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(playerModel.position),
            Text(' | '),
            Text(playerModel.birthDate.toServerDate()),
            Text(' | '),
            Text(playerModel.hand),
          ],
        ),
        Gap.h32,
        Container(
          color: Team.fromID(playerModel.teamId).color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                  width: (context.sizeWidth - 64) / 3,
                  child: Center(
                      child: Text(
                    'AB',
                    style: context.textStyleB14r.copyWith(
                      color: context.colorN100,
                    ),
                  ))),
              SizedBox(
                  width: (context.sizeWidth - 64) / 3,
                  child: Center(
                      child: Text(
                    'H',
                    style: context.textStyleB14r.copyWith(
                      color: context.colorN100,
                    ),
                  ))),
              SizedBox(
                  width: (context.sizeWidth - 64) / 3,
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
            SizedBox(
              width: (context.sizeWidth - 64) / 3,
              child: Center(child: Text(batterInfo.atBat.toString())),
            ),
            SizedBox(
              width: (context.sizeWidth - 64) / 3,
              child: Center(child: Text(batterInfo.hit.toString())),
            ),
            SizedBox(
              width: (context.sizeWidth - 64) / 3,
              child: Center(child: Text(batterInfo.homeRun.toString())),
            ),
          ],
        ),
        Container(
          color: Team.fromID(playerModel.teamId).color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                  width: (context.sizeWidth - 64) / 3,
                  child: Center(
                      child: Text(
                    'RBI',
                    style: context.textStyleB14r.copyWith(
                      color: context.colorN100,
                    ),
                  ))),
              SizedBox(
                  width: (context.sizeWidth - 64) / 3,
                  child: Center(
                      child: Text(
                    'SO',
                    style: context.textStyleB14r.copyWith(
                      color: context.colorN100,
                    ),
                  ))),
              SizedBox(
                  width: (context.sizeWidth - 64) / 3,
                  child: Center(
                      child: Text(
                    'BB',
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
            SizedBox(width: (context.sizeWidth - 64) / 3, child: Center(child: Text(batterInfo.rbi.toString()))),
            SizedBox(width: (context.sizeWidth - 64) / 3, child: Center(child: Text(batterInfo.strikeout.toString()))),
            SizedBox(width: (context.sizeWidth - 64) / 3, child: Center(child: Text(batterInfo.walk.toString()))),
          ],
        ),
        Container(
          color: Team.fromID(playerModel.teamId).color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                  width: (context.sizeWidth - 64) / 3,
                  child: Center(
                      child: Text(
                    'AVG',
                    style: context.textStyleB14r.copyWith(
                      color: context.colorN100,
                    ),
                  ))),
              SizedBox(
                  width: (context.sizeWidth - 64) / 3,
                  child: Center(
                      child: Text(
                    'OPS',
                    style: context.textStyleB14r.copyWith(
                      color: context.colorN100,
                    ),
                  ))),
              SizedBox(
                  width: (context.sizeWidth - 64) / 3,
                  child: Center(
                      child: Text(
                    'RE24',
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
            SizedBox(
                width: (context.sizeWidth - 64) / 3, child: Center(child: Text(batterInfo.average.toStringAsFixed(3)))),
            SizedBox(
                width: (context.sizeWidth - 64) / 3, child: Center(child: Text(batterInfo.ops.toStringAsFixed(3)))),
            SizedBox(width: (context.sizeWidth - 64) / 3, child: Center(child: Text(batterInfo.re24.toString()))),
          ],
        ),
      ],
    );
  }
}
