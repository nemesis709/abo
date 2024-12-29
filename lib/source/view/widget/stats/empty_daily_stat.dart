import 'package:abo/app_common.dart';
import 'package:abo/common/common_constants.dart';
import 'package:abo/common/extension/datetime_extension.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/domain/team_model.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:flutter/material.dart';

class EmptyDailyStat extends StatelessWidget {
  const EmptyDailyStat({
    super.key,
    required this.playerModel,
  });

  final PlayerModel playerModel;
  @override
  Widget build(BuildContext context) {
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
        Center(child: Text('출장 기록이 없습니다', style: context.textStyleT14b)),
      ],
    );
  }
}
