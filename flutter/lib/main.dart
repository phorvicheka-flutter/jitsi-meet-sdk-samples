import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

import 'di/components/service_locator.dart';
import 'firebase_options.dart';
import 'ui/my_app.dart';

var logger = Logger();

Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // Toggle Crashlytics collection
    if (kDebugMode) {
      // Force disable Crashlytics collection while doing every day development.
      // Temporarily toggle this to true if you want to test crash reporting in your app.
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    } else {
      // Handle Crashlytics enabled status when not in Debug,
      // e.g. allow your users to opt-in to crash reporting.
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    }
    // TEST: Firebase Crashlytics
    // FirebaseCrashlytics.instance.crash();

    await setPreferredOrientations();

    await setupServiceLocator();

    // Add license files for each google font
    LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString('google_fonts/LICENSE.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    });
    LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString('google_fonts/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    });

    // Handling errors caught by Flutter
    FlutterError.onError = (FlutterErrorDetails errorDetails) {
      // Pass all uncaught errors from the framework to Crashlytics.
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);

      // FlutterError.presentError(details);
      logger.e('details:\n $errorDetails');
      if (kReleaseMode) {
        exit(1);
      }
    };

    GoRouter.optionURLReflectsImperativeAPIs = true;
    // turn off the # in the URLs on the web
    usePathUrlStrategy();
    runApp(const MyApp());
  }, (Object error, StackTrace stack) {
    // Handling errors not caught by Flutter
    FirebaseCrashlytics.instance.recordError(error, stack);

    logger.e('stack:\n $stack');
    logger.e('error:\n $error');
    if (kReleaseMode) {
      exit(1);
    }
  });
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}
