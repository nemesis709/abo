import 'dart:math';

import 'package:abo/common/extension/build_context_extension.dart';
import 'package:abo/common/loadable_content.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/view/page/batter_stat.dart';
import 'package:abo/source/view/page/pitcher_stat.dart';
import 'package:abo/source/view/widget/default_bottom_sheet.dart';
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
              ...(asyncValue.sublist(0, min(10, asyncValue.length))).mapIndexed((index, e) => PlayerItem(index + 1, e)),
            ],
          );
        });
  }
}

class PlayerItem extends StatelessWidget {
  const PlayerItem(
    this.rank,
    this.playerInfo, {
    super.key,
  });

  final int rank;
  final PlayerModel playerInfo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (playerInfo.isPitcher) {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return DefaultBottomSheet(
                    maxHeight: context.sizeHeight * 0.8,
                    minHeight: context.sizeHeight * 0.5,
                    child: PitcherStatPage(playerInfo: playerInfo));
              });
        } else {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return DefaultBottomSheet(
                    maxHeight: context.sizeHeight * 0.8,
                    minHeight: context.sizeHeight * 0.5,
                    child: BatterStatPage(playerInfo: playerInfo));
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
                playerInfo.name,
                style: context.textStyleT14b,
              ),
            ),
            SizedBox(
              width: 30,
              child: Center(
                child: Text(
                  playerInfo.position,
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
                  '20 P',
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
