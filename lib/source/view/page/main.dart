import 'package:abo/common/common_constants.dart';
import 'package:abo/gen/assets.gen.dart';
import 'package:abo/source/controller/player_controller.dart';
import 'package:abo/source/controller/user_controller.dart';
import 'package:abo/source/view/widget/manager_rank.dart';
import 'package:abo/source/view/widget/player_rank.dart';
import 'package:abo/source/view/widget/score_view.dart';
import 'package:abo/ui/route/app_router.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 48, child: Assets.images.logo.svg()),
            Text('ABO', style: context.textStyleT16b.copyWith(color: context.colorP10)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ScoreView(
                dateTime: DateTime.now().copyWith(hour: 0, minute: 0, second: 0, microsecond: 0, millisecond: 0),
                isMain: true),
            Container(height: 12, color: context.colorN95),
            _RankBoard(),
            Container(height: 12, color: context.colorN95),
            _TradeBoard(),
            Gap.h40,
          ],
        ),
      ),
    );
  }
}

class _RankBoard extends ConsumerStatefulWidget {
  @override
  ConsumerState<_RankBoard> createState() => _RankBoardState();
}

class _RankBoardState extends ConsumerState<_RankBoard> {
  bool isManager = true;

  @override
  Widget build(BuildContext context) {
    final userController = ref.watch(userControllerProvider);
    final playerController = ref.watch(playerControllerProvider(null));

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '랭킹',
                style: context.textStyleT16b.copyWith(color: context.colorP10),
              ),
              Gap.w16,
              InkWell(
                onTap: () => setState(() {
                  isManager = true;
                }),
                child: Text(
                  '감독',
                  style: (isManager
                      ? context.textStyleT14b.copyWith(color: context.colorP10)
                      : context.textStyleT14r.copyWith(color: context.colorN40)),
                ),
              ),
              Text(' | '),
              InkWell(
                onTap: () => setState(() {
                  isManager = false;
                }),
                child: Text(
                  '선수',
                  style: (isManager
                      ? context.textStyleT14r.copyWith(color: context.colorN40)
                      : context.textStyleT14b.copyWith(color: context.colorP10)),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () => context.pushRoute(RankRoute()),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                ),
              ),
            ],
          ),
          Gap.h16,
          isManager ? ManagerRank(userController: userController) : PlayerRank(playerController: playerController),
        ],
      ),
    );
  }
}

class _TradeBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('트레이드', style: context.textStyleT16b.copyWith(color: context.colorP10)),
          Gap.h16,
          const Row(
            children: [
              Text('박찬호'),
            ],
          ),
          const Row(
            children: [
              Text('고영표'),
            ],
          ),
          const Row(
            children: [
              Text('노시환'),
            ],
          ),
        ],
      ),
    );
  }
}
