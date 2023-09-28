import 'package:flutter/material.dart';

const _defaultFontFamily = 'SpoqaHanSansNeo';
const _defaultFontWeight = FontWeight.w400;
const _defaultLeadingDistribution = TextLeadingDistribution.even;
const _defaultFontColor = Colors.black;

const TextTheme appTextTheme = TextTheme(
  displayLarge: TextStyle(
      height: 1.33,
      fontSize: 57,
      leadingDistribution: _defaultLeadingDistribution,
      fontFamily: _defaultFontFamily,
      fontWeight: _defaultFontWeight,
      letterSpacing: 0),
  displayMedium: TextStyle(
      height: 1.33,
      fontSize: 45,
      leadingDistribution: _defaultLeadingDistribution,
      fontFamily: _defaultFontFamily,
      fontWeight: _defaultFontWeight,
      letterSpacing: 0),
  displaySmall: TextStyle(
      height: 1.33,
      fontSize: 36,
      leadingDistribution: _defaultLeadingDistribution,
      fontFamily: _defaultFontFamily,
      fontWeight: _defaultFontWeight,
      letterSpacing: 0),
  headlineLarge: TextStyle(
      height: 1.33,
      fontSize: 30,
      leadingDistribution: _defaultLeadingDistribution,
      fontFamily: _defaultFontFamily,
      fontWeight: _defaultFontWeight,
      letterSpacing: 0),
  headlineMedium: TextStyle(
      height: 1.50,
      fontSize: 20,
      leadingDistribution: _defaultLeadingDistribution,
      fontFamily: _defaultFontFamily,
      fontWeight: _defaultFontWeight,
      letterSpacing: 0),
  headlineSmall: TextStyle(
      height: 1.33,
      fontSize: 18,
      leadingDistribution: _defaultLeadingDistribution,
      fontFamily: _defaultFontFamily,
      fontWeight: _defaultFontWeight,
      letterSpacing: 0),
  titleLarge: TextStyle(
      height: 1.5,
      fontSize: 16,
      leadingDistribution: _defaultLeadingDistribution,
      fontFamily: _defaultFontFamily,
      fontWeight: _defaultFontWeight,
      letterSpacing: 0),
  titleMedium: TextStyle(
      height: 1.714,
      fontSize: 14,
      leadingDistribution: _defaultLeadingDistribution,
      fontFamily: _defaultFontFamily,
      fontWeight: _defaultFontWeight,
      letterSpacing: 0.15),
  titleSmall: TextStyle(
      height: 1.33,
      fontSize: 12,
      leadingDistribution: _defaultLeadingDistribution,
      fontFamily: _defaultFontFamily,
      fontWeight: _defaultFontWeight,
      letterSpacing: 0.1),
  bodyLarge: TextStyle(
      height: 1.33,
      fontSize: 18,
      leadingDistribution: _defaultLeadingDistribution,
      fontFamily: _defaultFontFamily,
      fontWeight: _defaultFontWeight,
      letterSpacing: 0.15),
  bodyMedium: TextStyle(
      height: 1.71,
      fontSize: 14,
      leadingDistribution: _defaultLeadingDistribution,
      fontFamily: _defaultFontFamily,
      fontWeight: _defaultFontWeight,
      letterSpacing: 0.25),
  bodySmall: TextStyle(
      height: 1.33,
      fontSize: 12,
      leadingDistribution: _defaultLeadingDistribution,
      fontFamily: _defaultFontFamily,
      fontWeight: _defaultFontWeight,
      letterSpacing: 0.4),
  labelLarge: TextStyle(
      height: 1.14,
      fontSize: 14,
      leadingDistribution: _defaultLeadingDistribution,
      fontFamily: _defaultFontFamily,
      fontWeight: _defaultFontWeight,
      letterSpacing: 0.1),
  labelMedium: TextStyle(
      height: 1.33,
      fontSize: 12,
      leadingDistribution: _defaultLeadingDistribution,
      fontFamily: _defaultFontFamily,
      fontWeight: _defaultFontWeight,
      letterSpacing: 0.5),
  labelSmall: TextStyle(
      height: 1.33,
      fontSize: 11,
      leadingDistribution: _defaultLeadingDistribution,
      fontFamily: _defaultFontFamily,
      fontWeight: _defaultFontWeight,
      letterSpacing: 0.5),
);

extension BuildContextTextStyleExtension on BuildContext {
  TextTheme get _textTheme => Theme.of(this).textTheme;

  /// Headline
  /// GNB 영역 text / bottom, modal, 상세 페이지 head text / 배너에 이벤트성 큰 글씨
  TextStyle get textStyleH40r =>
      _textTheme.headlineLarge!.copyWith(height: 1, fontSize: 40, fontWeight: FontWeight.w400);

  TextStyle get textStyleH40m =>
      _textTheme.headlineLarge!.copyWith(height: 1, fontSize: 40, fontWeight: FontWeight.w500);

  TextStyle get textStyleH40b =>
      _textTheme.headlineLarge!.copyWith(height: 1, fontSize: 40, fontWeight: FontWeight.w700);

  TextStyle get textStyleH30r => _textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w400);

  TextStyle get textStyleH30m => _textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w500);

  TextStyle get textStyleH30b => _textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w700);

  TextStyle get textStyleH20r => _textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w400);

  TextStyle get textStyleH20m => _textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w500);

  TextStyle get textStyleH20b => _textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w700);

  TextStyle get textStyleH18r => _textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w400);

  TextStyle get textStyleH18m => _textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500);

  TextStyle get textStyleH18b => _textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w700);

  TextStyle get textStyleH16r =>
      _textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w400, fontSize: 16, height: 1.5);

  TextStyle get textStyleH16m =>
      _textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500, fontSize: 16, height: 1.5);

  TextStyle get textStyleH16b =>
      _textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w700, fontSize: 16, height: 1.5);

  /// Title
  /// 카드, 탭, 등
  TextStyle get textStyleT16r => _textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w400);

  TextStyle get textStyleT16m => _textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500);

  TextStyle get textStyleT16b => _textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700);

  TextStyle get textStyleT14r => _textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400);

  TextStyle get textStyleT14m => _textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500);

  TextStyle get textStyleT14b => _textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700);

  TextStyle get textStyleT12r => _textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400);

  TextStyle get textStyleT12m => _textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w500);

  TextStyle get textStyleT12b => _textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w700);

  /// Body
  /// 본문
  TextStyle get textStyleB18r => _textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w400);

  TextStyle get textStyleB18m => _textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500);

  TextStyle get textStyleB18b => _textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700);

  TextStyle get textStyleB14r => _textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400);

  TextStyle get textStyleB14m => _textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500);

  TextStyle get textStyleB14b => _textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700);

  TextStyle get textStyleB12r => _textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w400);

  TextStyle get textStyleB12m => _textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500);

  TextStyle get textStyleB12b => _textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w700);

  /// Label
  /// Alert, Label, Info, etc
  TextStyle get textStyleL14r => _textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w400);

  TextStyle get textStyleL14m => _textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500);

  TextStyle get textStyleL14b => _textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w700);

  TextStyle get textStyleL12r => _textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w400);

  TextStyle get textStyleL12m => _textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w500);

  TextStyle get textStyleL12b => _textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w700);

  TextStyle get textStyleL10r => _textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w400);

  TextStyle get textStyleL10m => _textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w500);

  TextStyle get textStyleL10b => _textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w700);
}

extension TextStyleExtension on TextStyle {
  TextStyle withColor(Color color) {
    return copyWith(color: color);
  }

  TextStyle withUnderline([Color? color, int spacing = 2]) {
    var defaultColor = color ?? this.color ?? _defaultFontColor;
    return copyWith(
        color: Colors.transparent,
        decoration: TextDecoration.underline,
        shadows: [Shadow(color: defaultColor, offset: Offset(0, spacing * -1))],
        decorationColor: defaultColor);
  }

  double? get textHeight {
    if (height != null && fontSize != null) {
      return height! * fontSize!;
    }
    return null;
  }

  double textsWidth(String text) {
    final textSpan = TextSpan(text: text, style: this);
    final textPainter = TextPainter(text: textSpan, textDirection: TextDirection.ltr);

    textPainter.layout();
    return textPainter.size.width;
  }
}