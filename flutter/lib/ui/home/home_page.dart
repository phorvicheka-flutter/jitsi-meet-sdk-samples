import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../data/shared_preferences/shared_preferences_helper.dart';
import 'package:provider/provider.dart';

import '../../change_notifiers/auth_change_notifier.dart';
import '../../change_notifiers/fcm_token_change_notifier.dart';
import '../../change_notifiers/users_change_notifier.dart';
import '../../data/models/user/user.dart';
import '../../di/components/service_locator.dart';
import '../../routes/routes.dart';
import '../../widgets/language_changer.dart';
import '../../widgets/theme_mode_toggle.dart';
import '../../widgets/theme_seed_color_changer.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations? t = AppLocalizations.of(context);
    final ValueNotifier<int> counter = useState<int>(0);
    User? user = context.select(
      (AuthChangeNotifier authChangeNotifier) => authChangeNotifier.user,
    );
    String? fcmToken = context.select(
      (FcmTokenChangeNotifier fcmTokenChangeNotifier) =>
          fcmTokenChangeNotifier.fcmToken,
    );

    useEffect(
      () {
        // https://github.com/rrousselGit/flutter_hooks/issues/153
        // https://www.faqcode4u.com/faq/370106/flutter-hooks-fetching-data-using-useeffect-setstate-or-markneedsbuild-called-during-build
        Future.microtask(
          () async => await context.read<UsersChangeNotifier>().getUsers(),
        );
        return null;
      },
      const [],
    );

    // https://github.com/rrousselGit/flutter_hooks/issues/73
    void incrementCounter() {
      counter.value++;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(t!.appTitle),
        actions: <Widget>[
          const LanguageChanger(),
          const ThemeModeToggle(),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthChangeNotifier>().logout();
            },
          ),
          const ThemeSeedColorChanger(),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('---------- userList ----------'),
              Text(context.watch<UsersChangeNotifier>().userList.toString()),
              const Text('\n---------- user ----------'),
              Text('userId:\n${user?.userId}\n'),
              Text('userName:\n${user?.userName}\n'),
              Text('token:\n${getIt<SharedPreferencesHelper>().authToken}\n'),
              Text('fcmToken:\n$fcmToken'),
              const Text('\n---------- other ----------'),
              Text(t.todayDate(DateTime.now())),
              Text(t.price(10000)),
              Text(t.helloWorld),
              Text(
                t.labelButtonClickCount,
              ),
              Text(
                t.buttonClickCount(counter.value),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              ElevatedButton(
                key: const Key('btn_plus'),
                onPressed: () {
                  const ProflieRoute().push(context);
                },
                child: Text(t.buttonProfile),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
