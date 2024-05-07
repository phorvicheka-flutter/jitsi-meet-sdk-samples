import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../change_notifiers/app_settings_change_notifier.dart';

class ThemeModeToggle extends StatelessWidget {
  const ThemeModeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return IconButton(
      icon: Theme.of(context).brightness == Brightness.light
          ? const Icon(Icons.brightness_3)
          : const Icon(Icons.brightness_7),
      onPressed: () {
        final appSettingsChangeNotifier =
            context.read<AppSettingsChangeNotifier>();
        if (isDark) {
          appSettingsChangeNotifier.setThemeModeToLight();
        } else {
          appSettingsChangeNotifier.setThemeModeToDark();
        }
      },
    );
  }
}
