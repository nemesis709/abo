import 'package:abo/common/common_constants.dart';
import 'package:abo/source/controller/player_controller.dart';
import 'package:abo/source/controller/user_controller.dart';
import 'package:abo/source/view/widget/user_rank.dart';
import 'package:abo/source/view/widget/player_rank.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class RankPage extends ConsumerStatefulWidget {
  const RankPage({super.key});

  @override
  ConsumerState<RankPage> createState() => _RankPageState();
}

class _RankPageState extends ConsumerState<RankPage> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userController = ref.watch(userControllerProvider);
    final playerController = ref.watch(playerControllerProvider(null));

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: () => context.maybePop(),
            child: Icon(Icons.arrow_back_ios, size: 18),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(controller: controller, tabs: [
                Text('감독 랭킹', style: context.textStyleT14b.copyWith(color: context.colorP10)),
                Text('선수 랭킹', style: context.textStyleT14b.copyWith(color: context.colorP10)),
              ]),
              Gap.h16,
              Expanded(
                child: TabBarView(
                  controller: controller,
                  children: [
                    UserRank(userController: userController),
                    PlayerRank(playerController: playerController),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
