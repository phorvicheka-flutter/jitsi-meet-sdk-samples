import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../data/network/apis/fcm_token_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../change_notifiers/auth_change_notifier.dart';
import '../../data/network/apis/auth_api.dart';
import '../../data/network/apis/users_api.dart';
import '../../data/network/dio_client.dart';
import '../../data/repositories/app_settings_repository.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/fcm_token_repository.dart';
import '../../data/repositories/users_repository.dart';
import '../../data/shared_preferences/shared_preferences_helper.dart';
import '../modules/local_module.dart';
import '../modules/network_module.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator({bool isTesting = false}) async {
  await getIt.reset();
  /* ------------------------------ Local module ------------------------------ */
  if (isTesting) {
    // ignore: invalid_use_of_visible_for_testing_member
    SharedPreferences.setMockInitialValues({});

    await SharedPreferences.getInstance().then((value) {
      getIt.registerSingleton<SharedPreferencesHelper>(
        SharedPreferencesHelper(value),
      );
    });
  } else {
    getIt.registerSingletonAsync<SharedPreferences>(
      () => LocalModule.provideSharedPreferences(),
    );
    getIt.registerSingleton<SharedPreferencesHelper>(
      SharedPreferencesHelper(await getIt.getAsync<SharedPreferences>()),
    );
  }

  /* ----------------------------- Network module ----------------------------- */
  getIt.registerSingleton<Dio>(
    NetworkModule.provideDio(
      getIt<SharedPreferencesHelper>(),
      isTesting: isTesting,
    ),
  );
  getIt.registerSingleton<DioClient>(DioClient(getIt<Dio>()));

  /* ----------------------------------- APIs ---------------------------------- */
  getIt.registerSingleton<AuthApi>(AuthApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton<UsersApi>(UsersApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton<FcmTokenApi>(
    FcmTokenApi(dioClient: getIt<DioClient>()),
  );

  /* ------------------------------ Repositories ------------------------------ */
  getIt.registerSingleton<AuthRepository>(
    AuthRepository(
      authApi: getIt<AuthApi>(),
      sharedPreferencesHelper: getIt<SharedPreferencesHelper>(),
    ),
  );
  getIt.registerSingleton<UsersRepository>(
    UsersRepository(usersApi: getIt<UsersApi>()),
  );
  getIt.registerSingleton<AppSettingsRepository>(
    AppSettingsRepository(getIt<SharedPreferencesHelper>()),
  );
  getIt.registerSingleton<FcmTokenRepository>(
    FcmTokenRepository(fcmTokenApi: getIt<FcmTokenApi>()),
  );

  /* ----------------------------- ChangeNotifiers ---------------------------- */
  // rootScaffoldMessengerKey: required by BaseChangeNotifier or all ChangeNotifier class that extends BaseChangeNotifier
  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  getIt.registerSingleton<GlobalKey<ScaffoldMessengerState>>(
    rootScaffoldMessengerKey,
  );
  // we registers only ChangeNotifier that we want it to be accessable without BuildContext context
  getIt.registerSingleton<AuthChangeNotifier>(
    AuthChangeNotifier(authRepository: getIt<AuthRepository>()),
  );
}
