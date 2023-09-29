import 'package:abo/common/common_constants.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class RankPage extends HookWidget {
  const RankPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> manager = <String>['장세민', '장세훈', '정재민'];
    final List<String> player = <String>['고영표', '소형준', '엄상백'];

    final controller = useTabController(initialLength: 2);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            '랭킹 보기',
            style: context.textStyleH20b.copyWith(color: context.colorP10),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(controller: controller, tabs: [
                Text('감독 랭킹',
                    style: context.textStyleT14b
                        .copyWith(color: context.colorP10)),
                Text('선수 랭킹',
                    style: context.textStyleT14b
                        .copyWith(color: context.colorP10)),
              ]),
              Gap.h16,
              Expanded(
                child: TabBarView(
                  controller: controller,
                  children: [
                    _InnerPage(targetList: manager, isManager: true),
                    _InnerPage(targetList: player, isManager: false),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class _InnerPage extends HookConsumerWidget {
  const _InnerPage({
    required this.targetList,
    required this.isManager,
  });

  final List<String> targetList;
  final bool isManager;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: context.textStyleT14r.fontSize! * 2,
                child: Text('순위', style: context.textStyleT14r)),
            Gap.w8,
            Text(isManager ? '감독명' : '선수명', style: context.textStyleT14r),
          ],
        ),
        _DisplayRank(list: targetList),
      ],
    );
  }
}

class _DisplayRank extends HookConsumerWidget {
  const _DisplayRank({required this.list});

  final List<String> list;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 50,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: context.textStyleT14r.fontSize! * 2,
                        child:
                            Text('${index + 1}', style: context.textStyleT14r)),
                    Gap.w8,
                    Text(list[index], style: context.textStyleT14r),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
