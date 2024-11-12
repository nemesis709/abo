import 'package:logger/logger.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

final logger = Logger(
  printer: SimplePrinter(),
);

class CustomLogger {
  void d(String message) {
    logger.d(message);
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
