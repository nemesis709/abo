import 'package:abo/common/common_constants.dart';
import 'package:abo/common/extension/datetime_extension.dart';
import 'package:abo/common/loadable_content.dart';
import 'package:abo/source/controller/calendar_controller.dart';
import 'package:abo/ui/route/app_router.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScoreView extends ConsumerStatefulWidget {
  const ScoreView({
    super.key,
    this.isMain,
  });

  final bool? isMain;

  @override
  ConsumerState<ScoreView> createState() => _ScoreViewState();
}

class _ScoreViewState extends ConsumerState<ScoreView> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return LoadableContent(
        asyncValue: ref.watch(calendarControllerProvider(
            dateTime: DateTime.now().copyWith(hour: 0, minute: 0, second: 0, microsecond: 0, millisecond: 0))),
        content: (asyncValue) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '경기 결과  ',
                      style: context.textStyleT16b.copyWith(color: context.colorP10),
                    ),
                    Text(
                      DateTime.now().displayDateDay(),
                      style: context.textStyleT14m.copyWith(color: context.colorN40),
                    ),
                    if (widget.isMain == true) ...[
                      Spacer(),
                      InkWell(
                        onTap: () => context.navigateTo(CalendarRoute()),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                        ),
                      ),
                    ],
                  ],
                ),
                Gap.h8,
                _ScoreView(
                  home: asyncValue[0][0].name,
                  homeScore: asyncValue[0][0].stat?.point ?? 0,
                  away: asyncValue[0][1].name,
                  awayScore: asyncValue[0][1].stat?.point ?? 0,
                ),
                Gap.h8,
                _ScoreView(
                  home: asyncValue[1][0].name,
                  homeScore: asyncValue[1][0].stat?.point ?? 0,
                  away: asyncValue[1][1].name,
                  awayScore: asyncValue[1][1].stat?.point ?? 0,
                ),
                Gap.h8,
                _ScoreView(
                  home: asyncValue[2][0].name,
                  homeScore: asyncValue[2][0].stat?.point ?? 0,
                  away: asyncValue[2][1].name,
                  awayScore: asyncValue[2][1].stat?.point ?? 0,
                ),
                Gap.h8,
                _ScoreView(
                  home: asyncValue[3][0].name,
                  homeScore: asyncValue[3][0].stat?.point ?? 0,
                  away: asyncValue[3][1].name,
                  awayScore: asyncValue[3][1].stat?.point ?? 0,
                ),
                Gap.h8,
                _ScoreView(
                  home: asyncValue[4][0].name,
                  homeScore: asyncValue[4][0].stat?.point ?? 0,
                  away: asyncValue[4][1].name,
                  awayScore: asyncValue[4][1].stat?.point ?? 0,
                ),
              ],
            ),
          );
        });
  }
}

class _ScoreView extends StatelessWidget {
  const _ScoreView({
    required this.home,
    required this.away,
    required this.homeScore,
    required this.awayScore,
  });

  final String home;
  final String away;
  final int homeScore;
  final int awayScore;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 60,
          child: Center(
            child: Text(
              away,
              style: context.textStyleT14b,
            ),
          ),
        ),
        SizedBox(
          width: 20,
          child: Center(
            child: (homeScore < awayScore)
                ? Text(
                    'W',
                    style: context.textStyleT12b.copyWith(color: context.colorVermillion),
                  )
                : Text(''),
          ),
        ),
        SizedBox(width: 60, child: Center(child: Text('$awayScore P'))),
        Center(child: Text('vs', style: context.textStyleT14r)),
        SizedBox(width: 60, child: Center(child: Text('$homeScore P'))),
        SizedBox(
          width: 20,
          child: Center(
            child: (homeScore > awayScore)
                ? Text(
                    'W',
                    style: context.textStyleT12b.copyWith(color: context.colorVermillion),
                  )
                : Text(''),
          ),
        ),
        SizedBox(
          width: 60,
          child: Center(
            child: Text(
              home,
              style: context.textStyleT14b,
            ),
          ),
        ),
      ],
    );
  }
}
