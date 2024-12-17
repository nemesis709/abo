import 'package:abo/app_common.dart';
import 'package:abo/common/common_constants.dart';
import 'package:abo/common/extension/build_context_extension.dart';
import 'package:abo/common/extension/datetime_extension.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/domain/team_model.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
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
                  width: (context.sizeWidth - 64) / 3,
                  child: Center(
                      child: Text(
                    'Inn.',
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
              child: Center(
                  child: Text(
                pitcherInfo.innings.toString(),
                style: context.textStyleT14b,
              )),
            ),
            SizedBox(
              width: (context.sizeWidth - 64) / 3,
              child: Center(
                  child: Text(
                pitcherInfo.hit.toString(),
                style: context.textStyleT14b,
              )),
            ),
            SizedBox(
              width: (context.sizeWidth - 64) / 3,
              child: Center(
                  child: Text(
                pitcherInfo.earnedRus.toString(),
                style: context.textStyleT14b,
              )),
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
                child: Text(
                  pitcherInfo.strikeout.toString(),
                  style: context.textStyleT14b,
                ),
              ),
            ),
            SizedBox(
              width: (context.sizeWidth - 64) / 3,
              child: Center(
                child: Text(
                  pitcherInfo.walk.toString(),
                  style: context.textStyleT14b,
                ),
              ),
            ),
            SizedBox(
              width: (context.sizeWidth - 64) / 3,
              child: Center(
                child: Text(
                  pitcherInfo.homeRun.toString(),
                  style: context.textStyleT14b,
                ),
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
                child: Text(
                  pitcherInfo.era.toStringAsFixed(2),
                  style: context.textStyleT14b,
                ),
              ),
            ),
            SizedBox(
              width: (context.sizeWidth - 64) / 3,
              child: Center(
                child: Text(
                  pitcherInfo.whip.toStringAsFixed(2),
                  style: context.textStyleT14b,
                ),
              ),
            ),
            SizedBox(
              width: (context.sizeWidth - 64) / 3,
              child: Center(
                child: Text(
                  pitcherInfo.re24.toString(),
                  style: context.textStyleT14b,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
