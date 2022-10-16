import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:abo/route/app_router.gr.dart';
import 'package:abo/logger/logger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends HookWidget with AutoRouteAware {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MaterialApp.router(
      title: 'Flutter Auto Router',
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate:
          appRouter.delegate(navigatorObservers: () => [CustomRouteObserver()]),
    );
  }
}
