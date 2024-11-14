import 'package:abo/common/common_constants.dart';
import 'package:abo/common/extension/build_context_extension.dart';
import 'package:abo/common/loadable_content.dart';
import 'package:abo/source/controller/roaster_controller.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/controller/player_controller.dart';
import 'package:abo/source/view/page/batter_stat.dart';
import 'package:abo/source/view/page/pitcher_stat.dart';
import 'package:abo/source/view/widget/default_bottom_sheet.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class PlayerRoasterPage extends ConsumerStatefulWidget {
  const PlayerRoasterPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayerRoasterPageState();
}

class _PlayerRoasterPageState extends ConsumerState<PlayerRoasterPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: LoadableContent(
              asyncValue: ref.watch(roasterControllerProvider),
              content: (content) {
                return SingleChildScrollView(
                  child: Column(
                    children: content.map((e) => _PlayerItem(playerInfo: e)).toList(),
                  ),
                );
              }),
        ));
  }
}

class _PlayerItem extends StatelessWidget {
  const _PlayerItem({required this.playerInfo});

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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              playerInfo.name,
              style: context.textStyleT16b.copyWith(color: context.colorN20),
            ),
            Gap.w4,
            Text(playerInfo.position),
            // Text(playerInfo.owner)
          ],
        ),
      ),
    );
  }
}