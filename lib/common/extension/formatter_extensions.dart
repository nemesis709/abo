import 'package:intl/intl.dart';

/// num 포멧팅 관련 확장 클래스
extension NumFormatterExtension on num {
  /// 통화를 포맷팅하여 반환한다.
  String formatCurrency() {
    return NumberFormat.simpleCurrency(locale: "ko_KR", name: "", decimalDigits: 0).format(this);
  }
}

/// String 포멧팅 관련 확장 클래스
extension StringFormatterExtension on String? {
  /// 주민등록번호를 포맷팅하고 마스킹처리하여 반환한다.
  String? formatSocialSecurityNumberWithMasking() {
    if (this == null || this!.length != 13) {
      return this;
    }
    return "${this!.substring(0, 6)}-${this!.substring(6, 7)}******";
  }

  /// 11자리의 휴대폰 번호를 포맷팅 한다.
  /// TODO:일반 전화 번호 처리 추가
  String? formatPhoneNumber() {
    if (this == null || this!.length != 11) {
      return this;
    }
    return "${this!.substring(0, 3)}-${this!.substring(3, 7)}-${this!.substring(7, this!.length)}";
  }
}
