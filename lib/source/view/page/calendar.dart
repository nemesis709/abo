import 'package:abo/common/common_constants.dart';
import 'package:abo/common/converter/datetime_converter.dart';
import 'package:abo/common/extension/build_context_extension.dart';
import 'package:abo/common/extension/datetime_extension.dart';
import 'package:abo/source/view/widget/default_bottom_sheet.dart';
import 'package:abo/source/view/widget/score_view.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

@RoutePage()
class CalendarPage extends ConsumerStatefulWidget {
  const CalendarPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CalendarPageState();
}

class _CalendarPageState extends ConsumerState<CalendarPage> with SingleTickerProviderStateMixin {
  DateTime focusedDay = DateTime.now().copyWith(hour: 0, minute: 0, second: 0, microsecond: 0, millisecond: 0);
  DateTime? selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '일정',
          style: context.textStyleB18b.copyWith(color: context.colorP10),
        ),
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return DefaultBottomSheet(
                      maxHeight: context.sizeHeight * 0.8,
                      child: TableCalendar(
                        calendarFormat: CalendarFormat.month,
                        firstDay: DateTime.utc(2023, 01, 01),
                        lastDay: DateTime.utc(2025, 12, 31),
                        headerStyle: HeaderStyle(
                          titleCentered: true,
                          formatButtonVisible: false,
                        ),
                        focusedDay: focusedDay,
                        selectedDayPredicate: (day) {
                          return isSameDay(selectedDay, day);
                        },
                        onDaySelected: (selected, focused) {
                          if (!isSameDay(selectedDay, selected)) {
                            // Call `setState()` when updating the selected day
                            setState(() {
                              selectedDay = selected;
                              focusedDay = focused;
                            });
                            context.maybePop();
                          }
                        },
                        onPageChanged: (focusedDay) {
                          // No need to call `setState()` here
                          focusedDay = focusedDay;
                        },
                      ),
                    );
                  });
            },
            child: Icon(Icons.calendar_month, size: 24),
          ),
          Gap.w16,
        ],
      ),
      body: Column(
        children: [
          ScoreView(
            dateTime: focusedDay,
            onPrev: () {
              setState(() {
                focusedDay = focusedDay.addDay(-1);
              });
            },
            onNext: () {
              setState(() {
                focusedDay = focusedDay.addDay(1);
              });
            },
          ),
        ],
      ),
    );
  }
}