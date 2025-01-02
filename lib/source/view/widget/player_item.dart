import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/domain/team_model.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:flutter/material.dart';

class PlayerItem extends StatelessWidget {
  const PlayerItem({
    super.key,
    required this.rank,
    required this.playerModel,
  });

  final int rank;
  final PlayerModel playerModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   if (playerModel.isPitcher) {
      //     showModalBottomSheet(
      //         isScrollControlled: true,
      //         context: context,
      //         builder: (context) {
      //           return DefaultBottomSheet(
      //               maxHeight: context.sizeHeight * 0.8,
      //               minHeight: context.sizeHeight * 0.5,
      //               child: PitcherStatPage(playerModel: playerModel));
      //         });
      //   } else {
      //     showModalBottomSheet(
      //         isScrollControlled: true,
      //         context: context,
      //         builder: (context) {
      //           return DefaultBottomSheet(
      //               maxHeight: context.sizeHeight * 0.8,
      //               minHeight: context.sizeHeight * 0.5,
      //               child: BatterStatPage(playerModel: playerModel));
      //         });
      //   }
      // },
      child: SizedBox(
        height: 30,
        child: Row(
          children: [
            SizedBox(
              width: 30,
              child: Text(
                rank.toString(),
                style: context.textStyleT14r,
              ),
            ),
            SizedBox(
                width: 80,
                child: Center(
                    child: Text(
                  playerModel.name,
                  style: context.textStyleT14b,
                ))),
            SizedBox(
                width: 40,
                child: Center(
                    child: Text(
                  Team.fromID(playerModel.teamId).name,
                  style: context.textStyleT14r,
                ))),
            SizedBox(
                width: 40,
                child: Center(child: Text(playerModel.position.displayString, style: context.textStyleT14r))),
            SizedBox(
                width: 60,
                child: Center(
                    child: Text(
                  playerModel.owner?.name ?? '',
                  style: context.textStyleT14r,
                ))),
            const Spacer(),
            SizedBox(
                width: 80,
                child: Center(child: Text(playerModel.point?.toString() ?? '', style: context.textStyleT14r))),
          ],
        ),
      ),
    );
  }
}

class PlayerHeader extends StatelessWidget {
  const PlayerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 30),
        SizedBox(
          width: 80,
          child: Center(
            child: Text(
              '',
              style: context.textStyleL10b.copyWith(color: context.colorN60),
            ),
          ),
        ),
        SizedBox(
          width: 40,
          child: Center(
            child: Text(
              '소속팀',
              style: context.textStyleL10b.copyWith(color: context.colorN60),
            ),
          ),
        ),
        SizedBox(
          width: 40,
          child: Center(
            child: Text(
              '포지션',
              style: context.textStyleL10b.copyWith(color: context.colorN60),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          child: Center(
            child: Text(
              '구단주',
              style: context.textStyleL10b.copyWith(color: context.colorN60),
            ),
          ),
        ),
        Spacer(),
        SizedBox(
          width: 80,
          child: Center(
            child: Text(
              '포인트',
              style: context.textStyleL10b.copyWith(color: context.colorN60),
            ),
          ),
        ),
      ],
    );
  }
}
