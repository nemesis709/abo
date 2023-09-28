import 'package:abo/ui/route/app_router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final appRouterProvider = Provider<AppRouter>((ref) {
  return AppRouter();
});