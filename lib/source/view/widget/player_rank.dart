import 'dart:math';

import 'package:abo/common/extension/build_context_extension.dart';
import 'package:abo/common/loadable_content.dart';
import 'package:abo/source/controller/player_controller.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/view/widget/default_bottom_sheet.dart';
import 'package:abo/source/view/widget/stats/batter_stat.dart';
import 'package:abo/source/view/widget/stats/pitcher_stat.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayerRank extends ConsumerWidget {
  const PlayerRank({
    super.key,
    required this.playerController,
    this.length,
  });

  final AsyncValue<List<PlayerModel>> playerController;
  final int? length;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LoadableContent(
        asyncValue: playerController,
        content: (asyncValue) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 30),
                  SizedBox(width: 60),
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
                    width: 30,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  SizedBox(
                    width: 60,
                    child: Center(
                      child: Text(
                        '포인트',
                        style: context.textStyleL10b.copyWith(color: context.colorN60),
                      ),
                    ),
                  ),
                ],
              ),
              ...ref
                  .read(playerControllerProvider(null).notifier)
                  .getPlayerRank()
                  .mapIndexed((index, e) => PlayerItem(index + 1, e)),
            ],
          );
        });
  }
}

class PlayerItem extends StatelessWidget {
  const PlayerItem(
    this.rank,
    this.playerModel, {
    super.key,
  });

  final int rank;
  final PlayerModel playerModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (playerModel.isPitcher) {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return DefaultBottomSheet(
                    maxHeight: context.sizeHeight * 0.8,
                    minHeight: context.sizeHeight * 0.5,
                    child: PitcherStat(playerModel: playerModel));
              });
        } else {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return DefaultBottomSheet(
                    maxHeight: context.sizeHeight * 0.8,
                    minHeight: context.sizeHeight * 0.5,
                    child: BatterStat(playerModel: playerModel));
              });
        }
      },
      child: SizedBox(
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 30,
              child: Text(
                rank.toString(),
                style: context.textStyleT14r,
              ),
            ),
            SizedBox(
              width: 60,
              child: Text(
                playerModel.name,
                style: context.textStyleT14b,
              ),
            ),
            SizedBox(
              width: 30,
              child: Center(
                child: Text(
                  playerModel.position.displayString,
                  style: context.textStyleT14r,
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            SizedBox(
              width: 30,
            ),
            SizedBox(
              width: 30,
            ),
            SizedBox(
              width: 40,
            ),
            SizedBox(
              width: 60,
              child: Center(
                child: Text(
                  '${playerModel.point ?? 0} P',
                  style: context.textStyleT14r,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
