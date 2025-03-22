import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  /// 상단 status bar height 또는 하단 height
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);
  double get viewPaddingTop => viewPadding.top;
  double get viewPaddingBottom => viewPadding.bottom;

  /// 상단 height는 0, 키패드가 올라온 경우 하단 height는 키패드 크기
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);
  double get viewInsetTop => viewInsets.top;
  double get viewInsetBottom => viewInsets.bottom;

  /// viewPadding 과 동일하나, 키패드가 올라온 경우 하단 height는 0
  /// max(0, viewPadding - viewInsets)
  EdgeInsets get padding => MediaQuery.paddingOf(this);
  double get paddingTop => padding.top;
  double get paddingBottom => padding.bottom;

  double get textScaleFactor => MediaQuery.textScaleFactorOf(this);

  Size get screenSize => MediaQuery.sizeOf(this);
  double get sizeHeight => screenSize.height;
  double get sizeWidth => screenSize.width;

  Orientation get orientation => MediaQuery.orientationOf(this);

  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;
  TextStyle? get displayLarge => textTheme.displayLarge;
  TextStyle? get displayMedium => textTheme.displayMedium;
  TextStyle? get displaySmall => textTheme.displaySmall;
  TextStyle? get headlineLarge => textTheme.headlineLarge;
  TextStyle? get headlineMedium => textTheme.headlineMedium;
  TextStyle? get headlineSmall => textTheme.headlineSmall;
  TextStyle? get titleLarge => textTheme.titleLarge;
  TextStyle? get titleMedium => textTheme.titleMedium;
  TextStyle? get titleSmall => textTheme.titleSmall;
  TextStyle? get bodyLarge => textTheme.bodyLarge;
  TextStyle? get bodyMedium => textTheme.bodyMedium;
  TextStyle? get bodySmall => textTheme.bodySmall;
  TextStyle? get labelLarge => textTheme.labelLarge;
  TextStyle? get labelMedium => textTheme.labelMedium;
  TextStyle? get labelSmall => textTheme.labelSmall;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Color get primaryColor => colorScheme.primary;
  Color get onPrimaryColor => colorScheme.onPrimary;
  Color get primaryContainerColor => colorScheme.primaryContainer;
  Color get onPrimaryContainerColor => colorScheme.onPrimaryContainer;
  Color get secondaryColor => colorScheme.secondary;
  Color get onSecondaryColor => colorScheme.onSecondary;
  Color get secondaryContainerColor => colorScheme.secondaryContainer;
  Color get onSecondaryContainerColor => colorScheme.onSecondaryContainer;
  Color get tertiaryColor => colorScheme.tertiary;
  Color get onTertiaryColor => colorScheme.onTertiary;
  Color get tertiaryContainerColor => colorScheme.tertiaryContainer;
  Color get onTertiaryContainerColor => colorScheme.onTertiaryContainer;
  Color get errorColor => colorScheme.error;
  Color get onErrorColor => colorScheme.onError;
  Color get errorContainerColor => colorScheme.errorContainer;
  Color get onErrorContainerColor => colorScheme.onErrorContainer;
  Color get backgroundColor => colorScheme.surface;
  Color get onBackgroundColor => colorScheme.onSurface;
  Color get surfaceColor => colorScheme.surface;
  Color get onSurfaceColor => colorScheme.onSurface;
  Color get surfaceVariantColor => colorScheme.surfaceContainerHighest;
  Color get onSurfaceVariantColor => colorScheme.onSurfaceVariant;
  Color get outlineColor => colorScheme.outline;
  Color get shadowColor => colorScheme.shadow;
  Color get inverseSurfaceColor => colorScheme.inverseSurface;
  Color get onInverseSurfaceColor => colorScheme.onInverseSurface;
  Color get inversePrimaryColor => colorScheme.inversePrimary;
  Color get surfaceTintColor => colorScheme.surfaceTint;
}
