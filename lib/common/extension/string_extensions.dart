import 'package:abo/common/extension/datetime_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Empty 관련, String 확장 클래스
extension StringCountExtension on String? {
  /// String이 빈 값인지 체크하여 T/F를 한다.
  bool get isEmptySpace {
    return ((this ?? '').trim().isEmpty);
  }

  bool get isNotEmptySpace {
    return !isEmptySpace;
  }
}

/// 기타 문자열 관련 확장 클래스
extension StringCommonExtension on String? {
  /// 문자열을 , 로 구분하여 반환한다.
  Iterable<String>? splitComma() {
    if (this == null) {
      return null;
    }

    if (isEmptySpace) {
      return const Iterable<String>.empty();
    }

    return this!.split(',');
  }

  bool isMobilePhoneNumber() {
    if (this == null) {
      return false;
    }
    var mobilePhoneRegex = RegExp(r'^01([016789])-?(\d{3,4})-?(\d{4})');
    return mobilePhoneRegex.hasMatch(this!);
  }

  /// 마지막 글자에 종성이 있는지 여부를 반환한다.
  bool hasFinalConsonant() {
    if (this == null || this!.isEmpty) {
      return false;
    }

    if (isLastCharKorean()) {
      final lastChar = this![this!.length - 1];
      return (lastChar.runes.last - 0xAC00) % 28 != 0;
    }
    return false;
  }

  /// 마지막 글자가 한글인지 여부를 반환한다.
  bool isLastCharKorean() {
    if (this == null || this!.isEmpty) {
      return false;
    }

    int uniCode = this![this!.length - 1].codeUnits[0];
    if ((uniCode >= 12593 && uniCode <= 12643) || (uniCode >= 44032 && uniCode <= 55203)) {
      return true;
    }
    return false;
  }
}

/// DateTime 관련, String 확장 클래스
extension StringDateTimeExtension on String? {
  /// 시간차이를 계산하여 분으로 반환한다.
  /// TODO 함수명 변경
  String waitingTime() {
    if (this == null) {
      return "";
    }
    return DateTime.now().difference(DateTime.parse(this!).toLocal()).inMinutes.toString();
  }

  /// yyyy.MM.dd 포맷으로 변환하여 반환한다.
  /// TODO 함수명 변경
  String displayDate() {
    if (this == null) {
      return "";
    }
    return DateFormat('yyyy.MM.dd').format(DateTime.parse(this!).toLocal());
  }

  /// 나이로 변환하여 반환한다.
  String birthDateToDisplayAge() {
    if (this == null) {
      return "";
    }
    return DateTime.parse(this!).birthdayToDisplayAge();
  }

  /// 나이로 변환하여 반환한다.
  String displaySexType([String? defaultValue]) {
    if (this == 'M') {
      return '남';
    }
    if (this == 'F') {
      return '여';
    }
    return defaultValue ?? '';
  }

  /// yyyy-MM-dd 포맷으로 변환하여 반환한다.
  /// TODO 함수명 변경
  String serverDate() {
    if (this == null) {
      return "";
    }
    return DateFormat('yyyy-MM-dd').format(DateTime.parse(this!).toLocal());
  }

  /// HH:mm 포맷으로 변환하여 반환한다.
  /// TODO 함수명 변경
  String displayTime() {
    if (this == null) {
      return "";
    }
    return DateFormat('HH:mm').format(DateTime.parse(this!).toLocal());
  }

  /// 오전/오후 h:mm 포맷으로 변환하여 반환한다.
  /// TODO 함수명 변경
  String reservationDateTime() {
    if (this == null) {
      return "";
    }
    return DateFormat.jm('ko').format(DateTime.parse(this!).toLocal());
  }

  /// yyyy-MM-dd(요일) 포맷으로 변환하여 반환한다.
  /// TODO 함수명 변경
  String registerDateDay() {
    if (this == null) {
      return "";
    }
    var day = DateFormat.E('ko_KR').format(DateTime.parse(this!).toLocal());
    var date = displayDate();
    return "$date($day)";
  }

  /// yyyy-MM-dd hh:mm:ss 포맷으로 변환하여 반환한다.
  /// TODO 함수명 변경
  String paymentDateTime() {
    if (this == null) {
      return "";
    }
    return DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.parse(this!).toLocal());
  }
}

extension StringCommonExtension2 on String {
  Color hexToColor() {
    return Color(int.parse(toLowerCase().substring(1, 7), radix: 16) + 0xFF000000);
  }

  DateTime toDateTime() {
    return DateTime.parse(this).toLocal();
  }
}
