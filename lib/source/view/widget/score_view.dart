import 'package:abo/common/common_constants.dart';
import 'package:abo/common/loadable_content.dart';
import 'package:abo/source/controller/calendar_controller.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScoreView extends ConsumerStatefulWidget {
  const ScoreView({
    super.key,
    required this.dateTime,
  });

  final DateTime dateTime;

  @override
  ConsumerState<ScoreView> createState() => _ScoreViewState();
}

class _ScoreViewState extends ConsumerState<ScoreView> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return LoadableContent(
        asyncValue: ref.watch(calendarControllerProvider(dateTime: widget.dateTime)),
        loading: SizedBox(),
        content: (asyncValue) {
          if (asyncValue.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '오늘의 경기가 없습니다.',
                style: context.textStyleT14b,
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...asyncValue.map((e) {
                  return _ScoreView(
                    home: e.homeUser?.name ?? '',
                    homeScore: 0,
                    away: e.awayUser?.name ?? '',
                    awayScore: 0,
                  );
                }),
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
    return Column(
      children: [
        Row(
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
        ),
        Gap.h8,
      ],
    );
  }
}
