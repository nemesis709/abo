import 'package:intl/intl.dart';

extension DateTimeEx on DateTime {
  /// 2022-12-27T15:12:07.113+09:00 형태로 포맷팅하여 반환한다.
  String formatISOTime() {
    var duration = timeZoneOffset;
    if (duration.isNegative) {
      return ("${DateFormat("yyyy-MM-ddTHH:mm:ss.SSS").format(this)}-${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
    } else {
      return ("${DateFormat("yyyy-MM-ddTHH:mm:ss.SSS").format(this)}+${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
    }
  }

  /// HH:mm 형태로 포맷팅하여 반환한다.
  String displayTime() {
    return DateFormat('HH:mm').format(this);
  }

  /// 오전/오후 HH:mm 형태로 포맷팅하여 반환한다.
  String displayMeridiemTime() {
    return DateFormat('aa hh:mm', 'ko_KR').format(this);
  }

  /// 오전/오후 H:mm 형태로 포맷팅하여 반환한다.
  String displayMeridiemTimeHMM() {
    return DateFormat('aa h:mm', 'ko_KR').format(this);
  }

  /// 오늘/내일/어제/format(MM/dd(E)) 형태의 날짜를 반환한다.
  String displayRelativeDay({String format = 'MM/dd(E)'}) {
    if (isToday()) {
      return '오늘';
    } else if (isTomorrow()) {
      return '내일';
    } else if (isYesterday()) {
      return '어제';
    } else {
      return DateFormat(format, 'ko_KR').format(this);
    }
  }

  /// yyyy.MM.dd HH:mm 형태로 포맷팅하여 반환한다.
  String displayDateTime() {
    return DateFormat('yyyy.MM.dd HH:mm').format(this);
  }

  /// 해당 날짜의 년도가 현재 년도와 같을 때 MM.dd 아니면 yyyy.MM.dd
  String displayDateTimeByYear() {
    if (this.year == DateTime.now().year) {
      return DateFormat('MM.dd').format(this);
    } else {
      return DateFormat('yyyy.MM.dd').format(this);
    }
  }
  /// 해당 날짜의 년도가 현재 년도와 같을 때 MM.dd(E) 아니면 yyyy.MM.dd(E)
  String displayDateYyyyMMDDEByYear() {
    if (this.year == DateTime.now().year) {
      return DateFormat('MM.dd(E)').format(this);
    } else {
      return DateFormat('yyyy.MM.dd(E)').format(this);
    }
  }

  /// 기본 날짜 표기 정책
  String displayDefaultDate() {
    if (isToday()) {
      return DateFormat('MM.dd (E) 오늘', 'ko_KR').format(this);
    } else if (year == DateTime.now().year) {
      return DateFormat('MM.dd (E)', 'ko_KR').format(this);
    } else {
      return DateFormat('yyyy.MM.dd (E)', 'ko_KR').format(this);
    }
  }

  /// 기본 날짜+시간 표기 정책
  String displayDefaultDateTime() {
    if (isToday()) {
      return DateFormat('aa h:mm', 'ko_KR').format(this);
    } else if (year == DateTime.now().year) {
      return DateFormat('MM.dd (E) aa h:mm', 'ko_KR').format(this);
    } else {
      return DateFormat('yyyy.MM.dd (E) aa h:mm', 'ko_KR').format(this);
    }
  }

  /// MM/dd 형태로 포맷팅하여 반환한다.
  String displayDate() {
    return DateFormat('MM/dd').format(this);
  }

  /// yyyy.MM.dd 형태로 포맷팅하여 반환한다.
  String displayYyyymmdd() {
    return DateFormat('yyyy.MM.dd').format(this);
  }

  /// yyyy.MM.dd(E) 형태로 포맷팅하여 반환한다.
  String displayDateDay() {
    return DateFormat('yyyy.MM.dd(E)').format(this);
  }

  /// yyyy년 MM월 형태로 포맷팅하여 반환한다.
  String displayDateYyyyMM() {
    return DateFormat('yyyy년 MM월', 'ko_KR').format(this);
  }

  /// MM월 dd일(요일) 형태로 포맷팅하여 반환한다.
  String displayDateMMddE() {
    return DateFormat('MM월 dd일(E)', 'ko_KR').format(this);
  }

  /// MM.dd 형태로 포맷팅하여 반환한다.
  String displayDateMMdd() {
    return DateFormat('MM.dd', 'ko_KR').format(this);
  }

  /// yyMMdd 형태로 포맷팅하여 반환한다.
  String displayBirthDaySix() {
    return DateFormat('yyMMdd', 'ko_KR').format(this);
  }

  /// yyyy-mm-dd 형태로 포맷팅하여 반환한다.
  String toServerDate() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  /// 날짜를 지정한 시간 단위로 내림하여 반환한다.
  DateTime roundDown({Duration delta = const Duration(hours: 1)}) {
    return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch - millisecondsSinceEpoch % delta.inMilliseconds);
  }

  String birthdayToDisplayAge([DateTime? baseDateTime, bool isAbbreviation = false]) {
    var diff = compareDates(baseDateTime ?? DateTime.now());

    if (year == 0 && month == 0) {
      return isAbbreviation ? '${diff.days}d' : '${diff.days}일';
    }

    if (year == 0) {
      return isAbbreviation ? '${diff.months}m${diff.days}d' : '${diff.months}개월 ${diff.days}일';
    }

    if (year >= 1 && year <= 6) {
      return isAbbreviation ? '${diff.years}y${diff.months}m' : '${diff.years}세 ${diff.months}개월';
    }

    if (year >= 7) return isAbbreviation ? '${diff.years}y' : '${diff.years}세';

    return isAbbreviation ? '${diff.years}y${diff.months}m' : '${diff.years}세 ${diff.months}개월';
  }

  DateTimeSpan compareDates(DateTime baseDate) {
    return DateTimeSpan.compareDates(this, baseDate);
  }

  DateTime addYear(int add) {
    return DateTime(year + add, month, day, hour, minute, second, millisecond, microsecond);
  }

  DateTime addMonth(int add) {
    return DateTime(year, month + add, day, hour, minute, second, millisecond, microsecond);
  }

  DateTime addDay(int add) {
    return DateTime(year, month, day + add, hour, minute, second, millisecond, microsecond);
  }

  DateTime addHour(int add) {
    return DateTime(year, month, day, hour + add, minute, second, millisecond, microsecond);
  }

  DateTime addMinute(int add) {
    return DateTime(year, month, day, hour, minute + add, second, millisecond, microsecond);
  }

  DateTime addSecond(int add) {
    return DateTime(year, month, day, hour, minute, second + add, millisecond, microsecond);
  }

  DateTime withHms(int hour, int minute, [int second = 0]) {
    return DateTime(year, month, day, hour, minute, second, 0, 0);
  }

  bool isPm() {
    return hour >= 12;
  }

  bool isAm() {
    return hour < 12;
  }

  /// 미래 날짜인지 여부
  bool isFutureDate() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day).isBefore(this);
  }

  /// 과거 날짜인지 여부
  bool isPast() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day).isAfter(this);
  }

  bool isToday() {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool isYesterday() {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day && yesterday.month == month && yesterday.year == year;
  }

  bool isTomorrow() {
    final yesterday = DateTime.now().add(const Duration(days: 1));
    return yesterday.day == day && yesterday.month == month && yesterday.year == year;
  }

  bool isSameDay(DateTime other) => year == other.year && month == other.month && day == other.day;

  /// 시간을 제외한 년월일만으로 변환하여 반환한다.
  DateTime date() {
    return DateTime(year, month, day);
  }

  // 몇 일전 인지 표시하는 문자열을 반환한다.
  String displayBeforeDateTime() {
    var baseDate = DateTime.now();
    var diff = baseDate.difference(this);

    if (diff.inSeconds < 60) {
      return '방금';
    }

    if (diff.inMinutes < 60) {
      return '${diff.inMinutes}분 전';
    }

    if (diff.inHours < 24) {
      return '${diff.inHours}시간 전';
    }

    if (diff.inHours < 24 * 15) {
      return '${diff.inDays}일 전';
    }

    if (baseDate.year == year) {
      return DateFormat('MM.dd', 'ko_KR').format(this);
    }

    return DateFormat('yyyy.MM.dd', 'ko_KR').format(this);
  }
}

extension DateTimeNullableEx on DateTime? {
  int compareToWithNull(DateTime? date2) {
    if (this == null && date2 == null) {
      return 0;
    } else if (this == null) {
      return -1;
    } else if (date2 == null) {
      return 1;
    } else {
      return this!.compareTo(date2);
    }
  }

  String displayHHmm() {
    if (this == null) {
      return '';
    }
    return DateFormat('HH:mm').format(this!);
  }

  String displayDateMMdd() {
    if (this == null) {
      return '';
    }
    return DateFormat('MM.dd').format(this!);
  }
}

class DateTimeUtil {
  DateTimeUtil._();

  static int daysInMonth(final int year, final int monthNum) {
    if (monthNum > 12) {
      return 30;
    }
    List<int> monthLength = List.filled(12, 0);
    monthLength[0] = 31;
    monthLength[2] = 31;
    monthLength[4] = 31;
    monthLength[6] = 31;
    monthLength[7] = 31;
    monthLength[9] = 31;
    monthLength[11] = 31;
    monthLength[3] = 30;
    monthLength[8] = 30;
    monthLength[5] = 30;
    monthLength[10] = 30;

    if (leapYear(year) == true) {
      monthLength[1] = 29;
    } else {
      monthLength[1] = 28;
    }

    return monthLength[monthNum - 1];
  }

  static bool leapYear(int year) {
    bool leapYear = false;
    bool leap = ((year % 100 == 0) && (year % 400 != 0));
    if (leap == true) {
      leapYear = false;
    } else if (year % 4 == 0) {
      leapYear = true;
    }

    return leapYear;
  }

  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  /// 현재 시간이 [startTime], [endTime] 안에 있는지 여부를 반환한다.
  static bool isInTime(DateTime? startTime, DateTime? endTime) {
    if (startTime == null && endTime == null) {
      return false;
    }

    var currentTime = DateTime.now();
    if (startTime != null && endTime != null) {
      var tempStartTime = currentTime.withHms(startTime.hour, startTime.minute, startTime.second);
      var tempEndTime = currentTime.withHms(endTime.hour, endTime.minute, endTime.second);
      return currentTime.isAfter(tempStartTime) && currentTime.isBefore(tempEndTime);
    }

    if (startTime == null) {
      var tempEndTime = currentTime.withHms(endTime!.hour, endTime.minute, endTime.second);
      return currentTime.isBefore(tempEndTime);
    }

    if (endTime == null) {
      var tempStartTime = currentTime.withHms(startTime!.hour, startTime.minute, startTime.second);
      return currentTime.isAfter(tempStartTime);
    }

    return false;
  }
}

enum Phase {
  years,
  months,
  days,
  done,
}

class DateTimeSpan {
  final int years;
  final int months;
  final int days;

  DateTimeSpan(this.years, this.months, this.days);

  static DateTimeSpan compareDates(DateTime date1, DateTime date2) {
    if (date2.isBefore(date1)) {
      var sub = date1;
      date1 = date2;
      date2 = sub;
    }

    DateTime current = date1;
    int years = 0;
    int months = 0;
    int days = 0;

    Phase phase = Phase.years;
    DateTimeSpan span = DateTimeSpan(0, 0, 0);
    int officialDay = current.day;

    while (phase != Phase.done) {
      switch (phase) {
        case Phase.years:
          if (current.addYear(years + 1).isAfter(date2)) {
            phase = Phase.months;
            current = current.addYear(years);
          } else {
            years++;
          }
          break;
        case Phase.months:
          if (current.addMonth(months + 1).isAfter(date2)) {
            phase = Phase.days;
            current = current.addMonth(months);
            if (current.day < officialDay && officialDay <= DateTimeUtil.daysInMonth(current.year, current.month)) {
              current = current.addDay(officialDay - current.day);
            }
          } else {
            months++;
          }
          break;
        case Phase.days:
          if (current.addDay(days + 1).isAfter(date2)) {
            current = current.addDay(days);
            span = DateTimeSpan(years, months, days);
            phase = Phase.done;
          } else {
            days++;
          }
          break;
        default:
          break;
      }
    }

    return span;
  }
}
