import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appThemeModeProvider = StateNotifierProvider<StateController<ThemeMode>, ThemeMode>(
  // (ref) => StateController(ThemeMode.system),
      (ref) => StateController(ThemeMode.light),
);

final appThemeProvider = Provider<AppTheme>(
      (ref) {
    final mode = ref.watch(appThemeModeProvider);
    switch (mode) {
      case ThemeMode.dark:
        return AppTheme.light();
      case ThemeMode.light:
      default:
        return AppTheme.light();
    }
  },
);

class AppTheme {
  AppTheme({
    required this.mode,
    required this.data,
    required this.textTheme,
    required this.appColor,
  });

  factory AppTheme.light() {
    const mode = ThemeMode.light;
    final appColors = AppColors.light();
    final themeData = ThemeData.light().copyWith(
      useMaterial3: true,
      splashColor: appColors.p90,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      scaffoldBackgroundColor: appColors.n100,
      unselectedWidgetColor: appColors.n60,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: appColors.p60,
        onPrimary: appColors.n100,
        primaryContainer: appColors.p90,
        onPrimaryContainer: appColors.p10,
        secondary: appColors.t60,
        onSecondary: appColors.n100,
        secondaryContainer: appColors.t90,
        onSecondaryContainer: appColors.t10,
        tertiary: appColors.n60,
        onTertiary: appColors.n100,
        tertiaryContainer: appColors.n90,
        onTertiaryContainer: appColors.n10,
        error: appColors.vermillion,
        onError: appColors.n100,
        errorContainer: appColors.vermillion.withOpacity(0.5),
        onErrorContainer: appColors.n10,
        background: appColors.n100,
        onBackground: appColors.n10,
        surface: appColors.n95,
        onSurface: appColors.n10,
        surfaceVariant: Colors.transparent,
        onSurfaceVariant: Colors.transparent,
        outline: appColors.n50,
        shadow: Colors.transparent,
        inverseSurface: appColors.n100,
        onInverseSurface: appColors.n10,
        inversePrimary: appColors.n90,
        surfaceTint: appColors.n100,
      ),
      dialogTheme: DialogTheme(
        backgroundColor: appColors.n100,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        titleTextStyle: appTextTheme.headlineMedium!.copyWith(color: appColors.n10),
        contentTextStyle: appTextTheme.titleLarge!.copyWith(color: appColors.n50),
      ),
      textTheme: appTextTheme.apply(bodyColor: appColors.n10, displayColor: appColors.n10),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          alignment: Alignment.centerLeft,
          padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0.0)),
          minimumSize: MaterialStateProperty.all<Size>(const Size.fromRadius(0.0)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          // backgroundColor: MaterialStatePropertyAll(Colors.black),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: appColors.n10, //<-- SEE HERE
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        side: MaterialStateBorderSide.resolveWith(
              (states) {
            if (states.contains(MaterialState.selected)) {
              if (states.contains(MaterialState.disabled)) {
                return const BorderSide(width: 1.0, color: Colors.transparent);
              }
              return BorderSide(width: 1.0, color: appColors.p60);
            }
            return BorderSide(width: 1.0, color: appColors.n90);
          },
        ),
        checkColor: MaterialStateProperty.resolveWith((states) {
          return appColors.n100;
        }),
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            if (states.contains(MaterialState.disabled)) {
              return appColors.p60.withOpacity(0.5);
            }
            return appColors.p60;
          }
          return appColors.n90;
        }),
        overlayColor: MaterialStateProperty.resolveWith((states) {
          return Colors.transparent;
        }),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
      ),
      iconTheme: IconThemeData(color: appColors.n10, size: 32),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          overlayColor: ButtonStyleButton.allOrNull<Color?>(Colors.transparent),
          iconSize: const MaterialStatePropertyAll(32),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: appColors.p60,
        unselectedItemColor: appColors.n30,
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        centerTitle: false,
        color: Colors.transparent,
        titleTextStyle: appTextTheme.headlineSmall?.copyWith(color: appColors.n10),
        foregroundColor: appColors.n10,
      ),
      cardTheme: CardTheme(
        color: appColors.n100,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: appColors.n10,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: appColors.n95,
        space: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appColors.p60, // background (button) color
          foregroundColor: appColors.n100, // foreground (text) color
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hoverColor: null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: appColors.n95, width: 1), borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: appColors.p60, width: 1), borderRadius: BorderRadius.circular(8)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: appColors.vermillion, width: 1), borderRadius: BorderRadius.circular(8)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: appColors.vermillion, width: 1), borderRadius: BorderRadius.circular(8)),
        errorStyle: appTextTheme.bodySmall!.copyWith(color: appColors.vermillion, fontWeight: FontWeight.w500),
        contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      ),
      tabBarTheme: TabBarTheme(
        indicator: UnderlineTabIndicator(
          borderRadius: BorderRadius.circular(2.0),
          borderSide: BorderSide(width: 2.0, color: appColors.n10),
        ),
        labelStyle: appTextTheme.titleLarge!.copyWith(color: appColors.n10, fontWeight: FontWeight.w700),
        unselectedLabelStyle: appTextTheme.titleLarge!.copyWith(color: appColors.n70, fontWeight: FontWeight.w500),
        labelColor: appColors.n10,
        unselectedLabelColor: appColors.n70,
        dividerColor: Colors.transparent,
        labelPadding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
        overlayColor: MaterialStateProperty.resolveWith((states) {
          return Colors.transparent;
        }),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: appColors.n100,
        backgroundColor: appColors.n10,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        width: 180,
      ),
      listTileTheme: const ListTileThemeData(
        horizontalTitleGap: 0,
        contentPadding: EdgeInsets.zero,
        visualDensity: VisualDensity(vertical: -1),
        dense: true,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        modalBackgroundColor: Colors.transparent,
        modalBarrierColor: appColors.n20.withOpacity(0.3),
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(0.0),
          ),
        ),
        clipBehavior: Clip.hardEdge,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: _AppButtonStyle.defaultStyle,
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return appColors.p60;
            }
            return appColors.n90;
          },
        ),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
      ),
      expansionTileTheme: const ExpansionTileThemeData(
        collapsedShape: Border(),
      ),
      extensions: <ThemeExtension<dynamic>>{
        CustomColorTheme.light,
      },
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        // replace default CupertinoPageTransitionsBuilder with this
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      }),
    );

    return AppTheme(
      mode: mode,
      data: themeData,
      textTheme: appTextTheme,
      appColor: appColors,
    );
  }

  final ThemeMode mode;
  final ThemeData data;
  final TextTheme textTheme;
  final AppColors appColor;
}

/// 앱에서 사용되는 버튼 스타일을 지정합니다.
class _AppButtonStyle {
  static AppColors appColors = AppColors.light();

  static ButtonStyle defaultStyle = ButtonStyle(
    shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(const EdgeInsets.fromLTRB(16, 12, 16, 12)),
    overlayColor: ButtonStyleButton.allOrNull<Color?>(Colors.transparent),
    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return appColors.p60.withOpacity(0.4);
        } else if (states.contains(MaterialState.pressed)) {
          return appColors.p50;
        }
        return appColors.p60;
      },
    ),
    foregroundColor: MaterialStateProperty.all(appColors.n100),
    textStyle: ButtonStyleButton.allOrNull<TextStyle?>(
        appTextTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500, color: appColors.n100)),
  );
}

/// 공통 버튼 스타일
extension BuildContextButtonStyleExtension on BuildContext {
  MaterialStateProperty<Color?> get materialStatePressedP95Opacity60Color => MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorP95.withOpacity(0.6);
      }
      return null;
    },
  );

  MaterialStateProperty<Color?> get _buttonN100BackgroundColor => MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return colorN100;
      } else if (states.contains(MaterialState.pressed)) {
        return colorN99;
      }
      return colorN100;
    },
  );

  MaterialStateProperty<Color?> get _buttonN100P60ForegroundColor => MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return colorN80;
      } else if (states.contains(MaterialState.pressed)) {
        return colorP50;
      }
      return colorP60;
    },
  );

  MaterialStateProperty<Color?> get _buttonN100CardBackgroundColor => MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return colorN100.withOpacity(0.5);
      } else if (states.contains(MaterialState.pressed)) {
        return colorN99;
      }
      return colorN100;
    },
  );

  MaterialStateProperty<Color?> get _buttonN100CardForegroundColor => MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return colorN20;
      } else if (states.contains(MaterialState.pressed)) {
        return colorN30;
      }
      return colorN30;
    },
  );

  MaterialStateProperty<Color?> get buttonP60StickyBackgroundColor => MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return colorN95;
      } else if (states.contains(MaterialState.pressed)) {
        return colorP50;
      }
      return colorP60;
    },
  );

  MaterialStateProperty<Color?> get buttonP60StickyForegroundColor => MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return colorN60;
      } else if (states.contains(MaterialState.pressed)) {
        return colorN100;
      }
      return colorN100;
    },
  );

  MaterialStateProperty<Color?> get buttonP99OpacityBackgroundColor => MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return colorP99.withOpacity(0.24);
      } else if (states.contains(MaterialState.pressed)) {
        return colorP95;
      }
      return colorP99.withOpacity(0.6);
    },
  );

  MaterialStateProperty<Color?> get buttonP99OpacityForegroundColor => MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return colorP50.withOpacity(0.4);
      } else if (states.contains(MaterialState.pressed)) {
        return colorP50;
      }
      return colorP50;
    },
  );

  MaterialStateProperty<Color?> get buttonOutlinedP60ForegroundColor => MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return colorP60.withOpacity(0.4);
      } else if (states.contains(MaterialState.pressed)) {
        return colorP60;
      }
      return colorP60;
    },
  );

  MaterialStateProperty<Color?> get buttonP95Opacity60BackgroundColor => MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return colorP95.withOpacity(0.24);
      } else if (states.contains(MaterialState.pressed)) {
        return colorP95;
      }
      return colorP95.withOpacity(0.6);
    },
  );

  MaterialStateProperty<Color?> get buttonP95Opacity60ForegroundColor => MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return colorP50.withOpacity(0.4);
      } else if (states.contains(MaterialState.pressed)) {
        return colorP50;
      }
      return colorP50;
    },
  );

  MaterialStateProperty<BorderSide?> get buttonOutlinedP60BorderColor => MaterialStateProperty.resolveWith<BorderSide?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return BorderSide(color: colorP60.withOpacity(0.4), width: 1.0);
      } else if (states.contains(MaterialState.pressed)) {
        return BorderSide(color: colorP60, width: 1.0);
      }
      return BorderSide(color: colorP60, width: 1.0);
    },
  );

  ///32
  ButtonStyle get buttonStyle32P60 => FilledButton.styleFrom(
    minimumSize: const Size(double.infinity, 32),
    padding: const EdgeInsets.fromLTRB(13, 4, 13, 4),
    // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );

  ButtonStyle get buttonStyle32P60Fitted =>
      buttonStyle32P60.copyWith(minimumSize: const MaterialStatePropertyAll(Size(0, 32)));

  ButtonStyle get buttonStyle32P60Opacity60 => buttonStyle32P60.copyWith(
    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return colorP60.withOpacity(0.24);
        } else if (states.contains(MaterialState.pressed)) {
          return colorP95;
        }
        return colorP60.withOpacity(0.6);
      },
    ),
    foregroundColor: MaterialStateProperty.all(colorP50),
    textStyle: ButtonStyleButton.allOrNull<TextStyle?>(
        appTextTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500, color: colorP50)),
  );

  ButtonStyle get buttonStyle32TransparentFittedOutlined => buttonStyle32P60.copyWith(
      backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
      padding: const MaterialStatePropertyAll(EdgeInsets.fromLTRB(16, 4, 16, 4)),
      side: MaterialStateProperty.all(BorderSide(color: colorP60, width: 1.0)),
      minimumSize: const MaterialStatePropertyAll(Size(0, 32)));

  ButtonStyle get buttonStyle32IconP60 => buttonStyle32P60.copyWith(
    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return colorN99.withOpacity(0.5);
        } else if (states.contains(MaterialState.pressed)) {
          return colorP99;
        }
        return colorP99;
      },
    ),
    foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return colorN60.withOpacity(0.5);
        } else if (states.contains(MaterialState.pressed)) {
          return colorP60;
        }
        return colorP60;
      },
    ),
    minimumSize: const MaterialStatePropertyAll(Size(32, 32)),
    padding: const MaterialStatePropertyAll(EdgeInsets.all(8)),
  );

  ButtonStyle get buttonStyle32N40 => buttonStyle32P60.copyWith(
      minimumSize: const MaterialStatePropertyAll(Size(double.minPositive, 32)),
      backgroundColor: MaterialStatePropertyAll(colorN100),
      foregroundColor: MaterialStatePropertyAll(colorN40),
      side: MaterialStatePropertyAll(BorderSide(width: 1, color: colorN40)));

  ButtonStyle get buttonStyle32N40Filled => buttonStyle32P60.copyWith(
      minimumSize: const MaterialStatePropertyAll(Size(double.minPositive, 32)),
      backgroundColor: MaterialStatePropertyAll(colorN40),
      foregroundColor: MaterialStatePropertyAll(colorN40),
      side: MaterialStatePropertyAll(BorderSide(width: 1, color: colorN40)));

  ///36
  ButtonStyle get buttonStyle36P60 =>
      FilledButton.styleFrom(minimumSize: const Size(double.infinity, 36), padding: const EdgeInsets.fromLTRB(16, 6, 16, 6));

  ButtonStyle get buttonStyle36P60FittedShrinkWrap => buttonStyle36P60.copyWith(
    minimumSize: const MaterialStatePropertyAll(Size(0, 36)),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );

  ///40
  ButtonStyle get buttonStyle40P60 =>
      FilledButton.styleFrom(minimumSize: const Size(double.infinity, 40), padding: const EdgeInsets.fromLTRB(16, 8, 16, 8));

  ButtonStyle get buttonStyle40P50Toggle => buttonStyle40P60.copyWith(
      backgroundColor: MaterialStatePropertyAll(colorP50), foregroundColor: MaterialStatePropertyAll(colorN100));

  ButtonStyle get buttonStyle40N99Toggle => buttonStyle40P60.copyWith(
      backgroundColor: MaterialStatePropertyAll(colorN99), foregroundColor: MaterialStatePropertyAll(colorN60));

  ButtonStyle get buttonStyle40ToggleOn => buttonStyle40P60.copyWith(
      backgroundColor: MaterialStatePropertyAll(colorP99),
      foregroundColor: MaterialStatePropertyAll(colorP50),
      side: MaterialStatePropertyAll(BorderSide(width: 1, color: colorP50)));

  ButtonStyle get buttonStyle40ToggleOff => buttonStyle40P60.copyWith(
      backgroundColor: MaterialStatePropertyAll(colorN100),
      foregroundColor: MaterialStatePropertyAll(colorN60),
      side: MaterialStatePropertyAll(BorderSide(width: 1, color: colorN95)));

  ButtonStyle get buttonStyle40ToggleDisabled => buttonStyle40P60.copyWith(
      backgroundColor: MaterialStatePropertyAll(colorN99.withOpacity(0.4)),
      foregroundColor: MaterialStatePropertyAll(colorN60.withOpacity(0.4)));

  ButtonStyle get buttonStyle40P99Opacity => buttonStyle40P60.copyWith(
    backgroundColor: buttonP99OpacityBackgroundColor,
    foregroundColor: buttonP99OpacityForegroundColor,
  );

  ButtonStyle get buttonStyle40P60FittedShrinkWrap => buttonStyle32P60.copyWith(
    minimumSize: const MaterialStatePropertyAll(Size(0, 40)),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );

  ButtonStyle get buttonStyle40P99OpacityFittedShrinkWrap => buttonStyle40P60FittedShrinkWrap.copyWith(
    backgroundColor: buttonP99OpacityBackgroundColor,
    foregroundColor: buttonP99OpacityForegroundColor,
  );

  ButtonStyle get buttonStyle40P95Opacity60FittedShrinkWrap => buttonStyle40P60FittedShrinkWrap.copyWith(
    backgroundColor: buttonP95Opacity60BackgroundColor,
    foregroundColor: buttonP95Opacity60ForegroundColor,
  );

  ButtonStyle get buttonStyle40P60Outlined => buttonStyle40P60.copyWith(
    side: buttonOutlinedP60BorderColor,
    backgroundColor: MaterialStateProperty.all(Colors.transparent),
    foregroundColor: buttonOutlinedP60ForegroundColor,
  );

  ButtonStyle get buttonStyle40P60FittedOutlinedShrinkWrap => buttonStyle40P60Outlined.copyWith(
    minimumSize: const MaterialStatePropertyAll(Size(0, 40)),
  );

  ///48
  ButtonStyle get buttonStyle48P60 =>
      FilledButton.styleFrom(minimumSize: const Size(double.infinity, 48), padding:const EdgeInsets.fromLTRB(16, 12, 16, 12));

  ButtonStyle get buttonStyle48P60Fitted =>
      buttonStyle48P60.copyWith(minimumSize: const MaterialStatePropertyAll(Size(0, 48)));

  ButtonStyle get buttonStyle48P60FittedOutlined =>
      buttonStyle40P60Outlined.copyWith(minimumSize: const MaterialStatePropertyAll(Size(0, 48)));

  ButtonStyle get buttonStyle48P60TransparentFittedOutlined =>
      buttonStyle40P60Outlined.copyWith(minimumSize: const MaterialStatePropertyAll(Size(0, 48)));

  ButtonStyle get buttonStyle48P60Text => buttonStyle48P60.copyWith(
    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return colorN100;
        } else if (states.contains(MaterialState.pressed)) {
          return colorN100;
        }
        return colorN100;
      },
    ),
    foregroundColor: MaterialStateProperty.all(colorP60),
    textStyle: ButtonStyleButton.allOrNull<TextStyle?>(appTextTheme.titleMedium!
        .copyWith(fontWeight: FontWeight.w500, color: colorP60, decoration: TextDecoration.underline)),
  );

  ButtonStyle get buttonStyle48BottomSheetText => buttonStyle48P60Text.copyWith(
    foregroundColor: MaterialStateProperty.all(colorBottomSheetDefaultText),
    textStyle: ButtonStyleButton.allOrNull<TextStyle?>(appTextTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w500, color: colorBottomSheetDefaultText, decoration: TextDecoration.underline)),
  );

  ButtonStyle get buttonStyle48P60FittedOpacity60 => buttonStyle48P60Fitted.copyWith(
    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return colorP60.withOpacity(0.24);
        } else if (states.contains(MaterialState.pressed)) {
          return colorP95;
        }
        return colorP60.withOpacity(0.6);
      },
    ),
    foregroundColor: MaterialStateProperty.all(colorP50),
    textStyle: ButtonStyleButton.allOrNull<TextStyle?>(
        appTextTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500, color: colorP50)),
  );

  ButtonStyle get buttonStyle48N100 => buttonStyle48P60.copyWith(
    backgroundColor: _buttonN100BackgroundColor,
    foregroundColor: _buttonN100P60ForegroundColor,
  );

  ButtonStyle get buttonStyle48P60Outlined => buttonStyle48N100.copyWith(
    side: buttonOutlinedP60BorderColor,
    backgroundColor: MaterialStateProperty.all(colorN100),
    foregroundColor: buttonOutlinedP60ForegroundColor,
  );

  ///56
  ButtonStyle get buttonStyle56P60 =>
      FilledButton.styleFrom(minimumSize: const Size(double.infinity, 56), padding: const EdgeInsets.fromLTRB(16, 12, 16, 12));

  ButtonStyle get buttonStyle56P60Square => buttonStyle56P60.copyWith(
      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 16)),
      shape: const MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero))));

  ButtonStyle get buttonStyle56P60SquareSafeArea => buttonStyle56P60Square.copyWith(
    minimumSize: const MaterialStatePropertyAll(Size(double.infinity, (56 + 16))),
    padding: const MaterialStatePropertyAll(EdgeInsets.fromLTRB(0, 20, 0, 16 + 16)),
  );

  // 배경 N100, 글씨 N30 컬러 버튼
  ButtonStyle get buttonStyle56N100 => buttonStyle56P60.copyWith(
    backgroundColor: _buttonN100CardBackgroundColor,
    foregroundColor: _buttonN100CardForegroundColor,
  );

  ButtonStyle get buttonStyle56N100N30Card => buttonStyle56P60Square.copyWith(
    backgroundColor: _buttonN100CardBackgroundColor,
    foregroundColor: _buttonN100CardForegroundColor,
  );

  ButtonStyle get buttonStyle56N100Square => buttonStyle56P60Square.copyWith(
    backgroundColor: _buttonN100BackgroundColor,
    foregroundColor: _buttonN100P60ForegroundColor,
  );

  ButtonStyle get buttonStyle56N100TopSquare => buttonStyle56P60Square.copyWith(
    backgroundColor: _buttonN100BackgroundColor,
    foregroundColor: _buttonN100P60ForegroundColor,
    shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)))),
  );
  //
  // ButtonStyle get buttonStyle56N100SquareSafeArea => buttonStyle56N100Square.copyWith(
  //   minimumSize: MaterialStatePropertyAll(
  //       Size(double.infinity, ((paddingBottom > 0 && viewInsetBottom < 100) ? 56 + 16 : 56))),
  //   padding: MaterialStatePropertyAll(
  //       EdgeInsets.fromLTRB(0, 20, 0, (paddingBottom > 0 && viewInsetBottom < 100) ? 16 + 16 : 16)),
  // );

  ///64
  ButtonStyle get buttonStyle64P60 => FilledButton.styleFrom(
    minimumSize: const Size(double.infinity, 64),
  );

  ButtonStyle get buttonStyle64P60Square => buttonStyle64P60.copyWith(
    padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 20)),
    shape: const MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero))),
    textStyle: MaterialStatePropertyAll(textStyleH16m),
  );
  //
  // ButtonStyle get buttonStyle64P60SquareSafeArea => buttonStyle64P60Square.copyWith(
  //   minimumSize: MaterialStatePropertyAll(
  //       Size(double.infinity, ((paddingBottom > 0 && viewInsetBottom < 100) ? 64 + 16 : 64))),
  //   padding: MaterialStatePropertyAll(
  //       EdgeInsets.fromLTRB(0, 20, 0, (paddingBottom > 0 && viewInsetBottom < 100) ? 20 + 16 : 20)),
  //   foregroundColor: buttonP60StickyForegroundColor,
  //   backgroundColor: buttonP60StickyBackgroundColor,
  // );
  //
  // ButtonStyle get buttonStyle64N100Square => buttonStyle64P60Square.copyWith(
  //   backgroundColor: _buttonN100BackgroundColor,
  //   foregroundColor: _buttonN100P60ForegroundColor,
  //   textStyle: MaterialStatePropertyAll(textStyleH16m),
  // );
  //
  // ButtonStyle get buttonStyle64N100SquareSafeArea => buttonStyle64N100Square.copyWith(
  //   minimumSize: MaterialStatePropertyAll(
  //       Size(double.infinity, ((paddingBottom > 0 && viewInsetBottom < 100) ? 64 + 16 : 64))),
  //   padding: MaterialStatePropertyAll(
  //       EdgeInsets.fromLTRB(0, 20, 0, (paddingBottom > 0 && viewInsetBottom < 100) ? 20 + 16 : 20)),
  // );
}

extension ColorExtension on Color {
  Color disabled(bool disabled) {
    if (!disabled) {
      return this;
    }
    return withOpacity(0.5);
  }
}