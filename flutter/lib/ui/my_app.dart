import 'dart:ui';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../change_notifiers/app_settings_change_notifier.dart';
import '../change_notifiers/auth_change_notifier.dart';
import '../change_notifiers/fcm_token_change_notifier.dart';
import '../change_notifiers/users_change_notifier.dart';
import '../constants/app_theme.dart';
import '../data/repositories/app_settings_repository.dart';
import '../data/repositories/fcm_token_repository.dart';
import '../data/repositories/users_repository.dart';
import '../di/components/service_locator.dart';
import '../routes/app_router.dart';
import '../widgets/firebase_notification_handler.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      getIt<GlobalKey<ScaffoldMessengerState>>();

  /* -------------- ChangeNotifiers that can be accessed with or without BuildContext context -------------- */
  static final AuthChangeNotifier authChangeNotifier =
      getIt<AuthChangeNotifier>();

  /* -------------- ChangeNotifiers that can be accessed only with BuildContext context -------------- */
  static final UsersChangeNotifier usersChangeNotifier =
      UsersChangeNotifier(getIt<UsersRepository>());
  static final AppSettingsChangeNotifier appSettingsChangeNotifier =
      AppSettingsChangeNotifier(getIt<AppSettingsRepository>());
  static final FcmTokenChangeNotifier fcmTokenChangeNotifier =
      FcmTokenChangeNotifier(getIt<FcmTokenRepository>());

  @override
  Widget build(BuildContext context) {
    // Retrieve locale from the system information.
    Locale myLocale = PlatformDispatcher.instance.locale;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthChangeNotifier>(
          create: (_) => authChangeNotifier,
        ),
        Provider<AppRouter>(create: (_) => AppRouter(authChangeNotifier)),
        ChangeNotifierProvider<UsersChangeNotifier>(
          create: (_) => usersChangeNotifier,
        ),
        ChangeNotifierProvider<AppSettingsChangeNotifier>(
          create: (_) => appSettingsChangeNotifier,
        ),
        ChangeNotifierProvider<FcmTokenChangeNotifier>(
          create: (_) => fcmTokenChangeNotifier,
        ),
      ],
      child: Builder(
        builder: (context) {
          final GoRouter goRouter =
              Provider.of<AppRouter>(context, listen: false).router;

          return DynamicColorBuilder(
            builder:
                (ColorScheme? lightColorScheme, ColorScheme? darkColorScheme) {
              return MaterialApp.router(
                scaffoldMessengerKey: rootScaffoldMessengerKey,
                routeInformationParser: goRouter.routeInformationParser,
                routerDelegate: goRouter.routerDelegate,
                routeInformationProvider: goRouter.routeInformationProvider,
                debugShowCheckedModeBanner: false,
                onGenerateTitle: (BuildContext context) {
                  return AppLocalizations.of(context)!.appTitle;
                },
                locale: context.watch<AppSettingsChangeNotifier>().locale,
                localizationsDelegates: const [
                  ...AppLocalizations.localizationsDelegates,
                  FormBuilderLocalizations.delegate,
                ],
                supportedLocales: AppLocalizations.supportedLocales,
                theme: AppTheme.lightTheme(
                  lightColorScheme,
                  languageCode: myLocale.languageCode,
                  seedColor:
                      context.watch<AppSettingsChangeNotifier>().themeSeedColor,
                ),
                darkTheme: AppTheme.darkTheme(
                  darkColorScheme,
                  languageCode: myLocale.languageCode,
                  seedColor:
                      context.watch<AppSettingsChangeNotifier>().themeSeedColor,
                ),
                themeMode: context.watch<AppSettingsChangeNotifier>().themeMode,
                //home: const HomePage(),
                builder: (BuildContext context, Widget? widget) {
                  // Define a custom error widget for build phase errors
                  ErrorWidget.builder = (FlutterErrorDetails errorDetails) =>
                      _buildError(errorDetails);
                  if (widget != null) {
                    return FirebaseNotificationHandler(child: widget);
                  }
                  throw ('widget is null');
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildError(FlutterErrorDetails errorDetails) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: SingleChildScrollView(
        child: Center(child: Text('$errorDetails')),
      ),
    );
  }
}
