
///Duration을 한글 String으로 변환
extension DurationExtension on Duration {
  String get durationStringBefore {
    String time = '';

      if (inMinutes <= 0) {
      return '방금';
    }

    if (inHours != 0) {
      time = '$time $inHours시간';
    }

    if (inMinutes.remainder(60) != 0) {
      time = '$time ${inMinutes.remainder(60)}분';
    }

    time = time.replaceFirst(' ', '');

    return '$time 전';
  }

  String get durationStringAfter {
    String time = '';

    if (inHours != 0) {
      time = '$time $inHours시간';
    }

    if (inMinutes.remainder(60) != 0) {
      time = '$time ${inMinutes.remainder(60)}분';
    }

    time = time.replaceFirst(' ', '');

    return '$time 뒤';
  }

  String get durationString {
    String time = '';

    if (inHours != 0) {
      time = '$time $inHours시간';
    }

    if (inMinutes.remainder(60) != 0) {
      time = '$time ${inMinutes.remainder(60)}분';
    }

    time = time.replaceFirst(' ', '');

    return time;
  }
}
