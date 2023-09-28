
import 'package:abo/app_common.dart';
import 'package:abo/common/logger/logger.dart';
import 'package:abo/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends HookConsumerWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeModeProvider);
    final appRouter = ref.watch(appRouterProvider);
    return MaterialApp.router(
      title: 'Flutter Auto Router',
      routeInformationParser: appRouter.defaultRouteParser(),
      theme: AppTheme.light().data,
      darkTheme: AppTheme.light().data,
      themeMode: themeMode,
      routerDelegate:
      appRouter.delegate(navigatorObservers: () => [CustomRouteObserver()]),
      supportedLocales: const [
        Locale('ko', 'KR'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
