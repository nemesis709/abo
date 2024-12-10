import 'package:abo/app_common.dart';
import 'package:abo/common/common_constants.dart';
import 'package:abo/common/extension/build_context_extension.dart';
import 'package:abo/common/extension/datetime_extension.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/domain/team_model.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:abo/source/domain/batter_stat_model.dart';
import 'package:flutter/material.dart';

class PitcherDailyStat extends StatelessWidget {
  const PitcherDailyStat({
    super.key,
    required this.playerModel,
  });

  final PlayerModel playerModel;
  @override
  Widget build(BuildContext context) {
    final pitcherInfo = playerModel.pitcherDailyStatModel;

    if (pitcherInfo == null) {
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
                    '이닝',
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
                    'R',
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
              child: Center(child: Text(pitcherInfo.innings.toString())),
            ),
            SizedBox(
              width: (context.sizeWidth - 64) / 3,
              child: Center(child: Text(pitcherInfo.hit.toString())),
            ),
            SizedBox(
              width: (context.sizeWidth - 64) / 3,
              child: Center(child: Text(pitcherInfo.earnedRus.toString())),
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
                    'K',
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
              child: Center(
                child: Text(pitcherInfo.strikeout.toString()),
              ),
            ),
            SizedBox(
              width: (context.sizeWidth - 64) / 3,
              child: Center(
                child: Text(pitcherInfo.walk.toString()),
              ),
            ),
            SizedBox(
              width: (context.sizeWidth - 64) / 3,
              child: Center(
                child: Text(pitcherInfo.homeRun.toString()),
              ),
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
                    'ERA',
                    style: context.textStyleB14r.copyWith(
                      color: context.colorN100,
                    ),
                  ))),
              SizedBox(
                  width: (context.sizeWidth - 64) / 3,
                  child: Center(
                      child: Text(
                    'WHIP',
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
              width: (context.sizeWidth - 64) / 3,
              child: Center(
                child: Text(pitcherInfo.era.toStringAsFixed(2)),
              ),
            ),
            SizedBox(
              width: (context.sizeWidth - 64) / 3,
              child: Center(
                child: Text(pitcherInfo.whip.toStringAsFixed(2)),
              ),
            ),
            SizedBox(
              width: (context.sizeWidth - 64) / 3,
              child: Center(
                child: Text(pitcherInfo.re24.toString()),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
