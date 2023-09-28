// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// https://www.figma.com/file/5j0xf6nXik96ULsBgIZ7KQ/PHR_Style-Guide?node-id=0-533&t=AWe396cZs9OnkIh4-0
class AppColors {
  const AppColors({
    required this.p10,
    required this.p20,
    required this.p30,
    required this.p40,
    required this.p50,
    required this.p60,
    required this.p70,
    required this.p80,
    required this.p90,
    required this.p95,
    required this.p99,
    required this.s10,
    required this.s20,
    required this.s30,
    required this.s40,
    required this.s50,
    required this.s60,
    required this.s70,
    required this.s80,
    required this.s90,
    required this.s95,
    required this.s99,
    required this.t10,
    required this.t20,
    required this.t30,
    required this.t40,
    required this.t50,
    required this.t60,
    required this.t70,
    required this.t80,
    required this.t90,
    required this.t95,
    required this.t99,
    required this.n10,
    required this.n20,
    required this.n30,
    required this.n40,
    required this.n50,
    required this.n60,
    required this.n70,
    required this.n80,
    required this.n90,
    required this.n95,
    required this.n99,
    required this.n100,
    required this.yellow,
    required this.bitterSweet,
    required this.vermillion,
    required this.pinkRose,
    required this.lavander,
    required this.darkLavander,
    required this.blueJeans,
    required this.green,
    required this.grass,
    required this.g30,
  });

  factory AppColors.light() {
    return const AppColors(
      p10: Color(0xFF0B0B3B),
      p20: Color(0xFF0B0B61),
      p30: Color(0xFF08088A),
      p40: Color(0xFF0404B4),
      p50: Color(0xFF0101DF),
      p60: Color(0xFF0000FF),
      p70: Color(0xFF2E2EFE),
      p80: Color(0xFF5858FA),
      p90: Color(0xFF8181F7),
      p95: Color(0xFFA9A9F5),
      p99: Color(0xFFCECEF6),
      s10: Color(0xFF271576),
      s20: Color(0xFF311B92),
      s30: Color(0xFF4527A0),
      s40: Color(0xFF603ABD),
      s50: Color(0xFF7047C2),
      s60: Color(0xFF825DC7),
      s70: Color(0xFF9575CD),
      s80: Color(0xFFB39DDB),
      s90: Color(0xFFD1C4E9),
      s95: Color(0xFFEDE7F6),
      s99: Color(0xFFF7F3FC),
      t10: Color(0xFF24433D),
      t20: Color(0xFF345750),
      t30: Color(0xFF4A7169),
      t40: Color(0xFF628A82),
      t50: Color(0xFF7EA69E),
      t60: Color(0xFF96BCB4),
      t70: Color(0xFFADCEC7),
      t80: Color(0xFFBFDBD5),
      t90: Color(0xFFCEE6E1),
      t95: Color(0xFFD9EDE9),
      t99: Color(0xFFEAF8F5),
      n10: Color(0xFF222224),
      n20: Color(0xFF434447),
      n30: Color(0xFF595A5F),
      n40: Color(0xFF74757A),
      n50: Color(0xFF919399),
      n60: Color(0xFFA5A8AE),
      n70: Color(0xFFB5B8BE),
      n80: Color(0xFFCDD0D6),
      n90: Color(0xFFDADCE1),
      n95: Color(0xFFEBECEF),
      n99: Color(0xFFF7F7FA),
      n100: Color(0xFFFFFFFF),
      yellow: Color(0xffF5C171),
      bitterSweet: Color(0xffF0805D),
      vermillion: Color(0xffF45A5A),
      pinkRose: Color(0xffE996CD),
      lavander: Color(0xffC1B2EF),
      darkLavander: Color(0xff8B69D2),
      blueJeans: Color(0xff7BB0EA),
      green: Color(0xff45BE75),
      grass: Color(0xffB8DC53),
      g30: Color(0xff7b8aff),
    );
  }

  final Color p10;
  final Color p20;
  final Color p30;
  final Color p40;
  final Color p50;
  final Color p60;
  final Color p70;
  final Color p80;
  final Color p90;
  final Color p95;
  final Color p99;

  final Color s10;
  final Color s20;
  final Color s30;
  final Color s40;
  final Color s50;
  final Color s60;
  final Color s70;
  final Color s80;
  final Color s90;
  final Color s95;
  final Color s99;

  final Color t10;
  final Color t20;
  final Color t30;
  final Color t40;
  final Color t50;
  final Color t60;
  final Color t70;
  final Color t80;
  final Color t90;
  final Color t95;
  final Color t99;

  final Color n10;
  final Color n20;
  final Color n30;
  final Color n40;
  final Color n50;
  final Color n60;
  final Color n70;
  final Color n80;
  final Color n90;
  final Color n95;
  final Color n99;
  final Color n100;

  final Color yellow;
  final Color bitterSweet;
  final Color vermillion;
  final Color pinkRose;
  final Color lavander;
  final Color darkLavander;
  final Color blueJeans;
  final Color green;
  final Color grass;
  final Color g30;
}

/// Custom color theme를 정의한 클래스
///
/// https://medium.com/@flutterqueen/how-do-i-add-material-3-custom-colors-in-flutter-3c2f7f2a8141
class CustomColorTheme extends ThemeExtension<CustomColorTheme> {
  final AppColors appColors;
  final Color? verticalDividerColor;
  final Color? headerColor;
  final Color? shimmerBaseColor;
  final Color? shimmerHighlightColor;
  final Color? holidayColor;
  final Color? saturdayColor;
  final Color? shadowColor;

  const CustomColorTheme({
    required this.appColors,
    required this.verticalDividerColor,
    required this.headerColor,
    required this.shimmerBaseColor,
    required this.shimmerHighlightColor,
    required this.holidayColor,
    required this.saturdayColor,
    required this.shadowColor,
  });

  @override
  ThemeExtension<CustomColorTheme> copyWith({
    AppColors? appColors,
    Color? verticalDividerColor,
    Color? headerColor,
    Color? shimmerBaseColor,
    Color? shimmerHighlightColor,
    Color? holidayColor,
    Color? saturdayColor,
    Color? shadowColor,
  }) {
    return CustomColorTheme(
      appColors: appColors ?? this.appColors,
      verticalDividerColor: verticalDividerColor ?? this.verticalDividerColor,
      headerColor: headerColor ?? this.headerColor,
      shimmerBaseColor: shimmerBaseColor ?? this.shimmerBaseColor,
      shimmerHighlightColor: shimmerHighlightColor ?? this.shimmerHighlightColor,
      holidayColor: holidayColor ?? this.holidayColor,
      saturdayColor: saturdayColor ?? this.saturdayColor,
      shadowColor: shadowColor ?? this.shadowColor,
    );
  }

  @override
  ThemeExtension<CustomColorTheme> lerp(ThemeExtension<CustomColorTheme>? other, double t) {
    if (other is! CustomColorTheme) {
      return this;
    }
    return CustomColorTheme(
      appColors: appColors,
      verticalDividerColor: Color.lerp(verticalDividerColor, other.verticalDividerColor, t),
      headerColor: Color.lerp(headerColor, other.headerColor, t),
      shimmerBaseColor: Color.lerp(shimmerBaseColor, other.shimmerBaseColor, t),
      shimmerHighlightColor: Color.lerp(shimmerHighlightColor, other.shimmerHighlightColor, t),
      holidayColor: Color.lerp(holidayColor, other.holidayColor, t),
      saturdayColor: Color.lerp(saturdayColor, other.saturdayColor, t),
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t),
    );
  }

  static CustomColorTheme light = CustomColorTheme(
    appColors: AppColors.light(),
    verticalDividerColor: AppColors.light().n95,
    headerColor: AppColors.light().n10.withOpacity(0.4),
    shimmerBaseColor: Colors.grey.shade300,
    shimmerHighlightColor: AppColors.light().n100,
    holidayColor: Colors.redAccent,
    saturdayColor: Colors.blueAccent,
    shadowColor: Colors.black.withOpacity(0.05),
  );
}

extension BuildContextCustomColorExtension on BuildContext {
  CustomColorTheme get customColorTheme => Theme.of(this).extension<CustomColorTheme>() ?? CustomColorTheme.light;

  Color get verticalDividerColor => customColorTheme.verticalDividerColor!;

  Color get headerColor => customColorTheme.verticalDividerColor!;

  Color get shimmerBaseColor => customColorTheme.shimmerBaseColor!;

  Color get shimmerHighlightColor => customColorTheme.shimmerHighlightColor!;

  Color get holidayColor => customColorTheme.holidayColor!;

  Color get saturdayColor => customColorTheme.saturdayColor!;

  Color get colorShadow => customColorTheme.shadowColor!;

  Color get colorBottomSheetDefaultText => customColorTheme.appColors.n40;

  Color get colorP10 => customColorTheme.appColors.p10;

  Color get colorP20 => customColorTheme.appColors.p20;

  Color get colorP30 => customColorTheme.appColors.p30;

  Color get colorP40 => customColorTheme.appColors.p40;

  Color get colorP50 => customColorTheme.appColors.p50;

  Color get colorP60 => customColorTheme.appColors.p60;

  Color get colorP70 => customColorTheme.appColors.p70;

  Color get colorP80 => customColorTheme.appColors.p80;

  Color get colorP90 => customColorTheme.appColors.p90;

  Color get colorP95 => customColorTheme.appColors.p95;

  Color get colorP99 => customColorTheme.appColors.p99;

  Color get colorS10 => customColorTheme.appColors.s10;

  Color get colorS20 => customColorTheme.appColors.s20;

  Color get colorS30 => customColorTheme.appColors.s30;

  Color get colorS40 => customColorTheme.appColors.s40;

  Color get colorS50 => customColorTheme.appColors.s50;

  Color get colorS60 => customColorTheme.appColors.s60;

  Color get colorS70 => customColorTheme.appColors.s70;

  Color get colorS80 => customColorTheme.appColors.s80;

  Color get colorS90 => customColorTheme.appColors.s90;

  Color get colorS95 => customColorTheme.appColors.s95;

  Color get colorS99 => customColorTheme.appColors.s99;

  Color get colorT10 => customColorTheme.appColors.t10;

  Color get colorT20 => customColorTheme.appColors.t20;

  Color get colorT30 => customColorTheme.appColors.t30;

  Color get colorT40 => customColorTheme.appColors.t40;

  Color get colorT50 => customColorTheme.appColors.t50;

  Color get colorT60 => customColorTheme.appColors.t60;

  Color get colorT70 => customColorTheme.appColors.t70;

  Color get colorT80 => customColorTheme.appColors.t80;

  Color get colorT90 => customColorTheme.appColors.t90;

  Color get colorT95 => customColorTheme.appColors.t95;

  Color get colorT99 => customColorTheme.appColors.t99;

  Color get colorN10 => customColorTheme.appColors.n10;

  Color get colorN20 => customColorTheme.appColors.n20;

  Color get colorN30 => customColorTheme.appColors.n30;

  Color get colorN40 => customColorTheme.appColors.n40;

  Color get colorN50 => customColorTheme.appColors.n50;

  Color get colorN60 => customColorTheme.appColors.n60;

  Color get colorN70 => customColorTheme.appColors.n70;

  Color get colorN80 => customColorTheme.appColors.n80;

  Color get colorN90 => customColorTheme.appColors.n90;

  Color get colorN95 => customColorTheme.appColors.n95;

  Color get colorN99 => customColorTheme.appColors.n99;

  Color get colorN100 => customColorTheme.appColors.n100;

  Color get colorYellow => customColorTheme.appColors.yellow;

  Color get colorBitterSweet => customColorTheme.appColors.bitterSweet;

  Color get colorVermillion => customColorTheme.appColors.vermillion;

  Color get colorPinkRose => customColorTheme.appColors.pinkRose;

  Color get colorLavander => customColorTheme.appColors.lavander;

  Color get colorDarkLavander => customColorTheme.appColors.darkLavander;

  Color get colorBlueJeans => customColorTheme.appColors.blueJeans;

  Color get colorGreen => customColorTheme.appColors.green;

  Color get colorGrass => customColorTheme.appColors.grass;

  Color get colorG30 => customColorTheme.appColors.g30;
}

extension ColorWithHSL on Color {
  HSLColor get hsl => HSLColor.fromColor(this);

  Color withSaturation(double saturation) {
    return hsl.withSaturation(clampDouble(saturation, 0.0, 1.0)).toColor();
  }

  Color withLightness(double lightness) {
    return hsl.withLightness(clampDouble(lightness, 0.0, 1.0)).toColor();
  }

  Color darken(double amount) {
    assert(amount >= 0 && amount <= 1);

    final hslLight = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }

  Color lighten(double amount) {
    assert(amount >= 0 && amount <= 1);

    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }

  Color withHue(double hue) {
    return hsl.withHue(clampDouble(hue, 0.0, 360.0)).toColor();
  }
}