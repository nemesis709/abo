import 'package:abo/common/loadable_content.dart';
import 'package:abo/source/controller/player_controller.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/view/widget/player_item.dart';
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
              PlayerHeader(),
              ...ref
                  .read(playerControllerProvider(null).notifier)
                  .getPlayerRank()
                  .mapIndexed((index, e) => PlayerItem(rank: index + 1, playerModel: e)),
            ],
          );
        });
  }
}
