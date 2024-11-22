import 'dart:async';

import 'package:abo/app.dart';
import 'package:abo/common/logger/logger.dart';
import 'package:abo/riverpod_logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    var notificationAppLaunchDetails = await ApplicationInit().init();

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    runApp(
      ProviderScope(
        observers: [RiverpodLogger()],
        child: const MyApp(),
      ),
    );

    // runApp(dp.DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => ProviderScope(
    //     observers: [RiverpodLogger()],
    //     child: MyApp(),
    //   ),
    // ));
  }, (error, stackTrace) {
    logger.e('[main runZonedGuarded]}', error: error, stackTrace: stackTrace);
  });
}

/// 어플리케이션 초기화
class ApplicationInit {
  static final ApplicationInit _instance = ApplicationInit._internal();

  factory ApplicationInit() {
    return _instance;
  }

  ApplicationInit._internal();

  Future<NotificationAppLaunchDetails?> init() async {
    registerErrorHandlers();

    Intl.defaultLocale = 'ko';
    await initializeDateFormatting('ko');
    await dotenv.load(fileName: ".env");
    await Supabase.initialize(
      url: dotenv.env['supabaseUrl'] ?? '',
      anonKey: dotenv.env['supbaseKey'] ?? '',
    );

    return null;
  }

  void registerErrorHandlers() {
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      logger.e('[FlutterError]', error: details.exception, stackTrace: details.stack);
    };

    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      logger.e('[PlatformDispatcher]', error: error, stackTrace: stack);
      return true;
    };

    ErrorWidget.builder = (FlutterErrorDetails details) {
      // TODO(에러화면)
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text('오류'),
          ),
          body: SingleChildScrollView(child: Text(details.toString())),
        ),
      );
    };
  }
}
