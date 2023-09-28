import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:auto_route/auto_route.dart';

final logger = Logger(
  printer: SimplePrinter(),
);

class CustomLogger {
  void d(String message) {
    logger.d(message);
  }
}

useWidgetLifecycleObserver(BuildContext context) {
  return use(const _WidgetObserver());
}

class _WidgetObserver extends Hook<void> {
  const _WidgetObserver();

  @override
  HookState<void, Hook<void>> createState() {
    return _WidgetObserverState();
  }
}

class _WidgetObserverState extends HookState<void, _WidgetObserver>
    with WidgetsBindingObserver {
  final logger = CustomLogger();
  @override
  void build(BuildContext context) {}

  @override
  void initHook() {
    super.initHook();
    logger.d("app state now is init");
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    logger.d("app state now is dispose");
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    logger.d("app state now is $state");
    super.didChangeAppLifecycleState(state);
  }
}

class CustomRouteObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    logger.d('New route pushed: ${route.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    logger.d('New route popped: ${route.settings.name}');
  }

// only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    logger.d('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    logger.d('Tab route re-visited: ${route.name}');
  }
}
