import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../change_notifiers/app_settings_change_notifier.dart';
import '../constants/app_settings.dart';

const List<String> languageValueOptions = [
  AppSettings.lauguageCodeEn,
  AppSettings.lauguageCodeKo,
];

class LanguageChanger extends StatelessWidget {
  const LanguageChanger({super.key});

  @override
  Widget build(BuildContext context) {
    Locale appLocale = context.select(
      (AppSettingsChangeNotifier appSettingsChangeNotifier) =>
          appSettingsChangeNotifier.locale,
    );

    Future<void> handleSelectLanguage(int value) async {
      final appSettingsChangeNotifier =
          context.read<AppSettingsChangeNotifier>();
      await appSettingsChangeNotifier
          .saveLanguageCode(languageValueOptions[value]);
    }

    return PopupMenuButton(
      icon: Stack(
        children: <Widget>[
          const Icon(Icons.language),
          Positioned(
            top: 0.0,
            right: 0.0,
            child: Text(
              languageValueOptions
                  .firstWhere((element) => element == appLocale.languageCode),
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (context) {
        return List.generate(languageValueOptions.length, (index) {
          return PopupMenuItem(
            value: index,
            enabled: languageValueOptions[index] != appLocale.languageCode,
            textStyle: TextStyle(
              color: languageValueOptions[index] == appLocale.languageCode
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onBackground,
            ),
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: _buildLanguageOptionItemText(
                    context,
                    languageValueOptions[index],
                  ),
                ),
              ],
            ),
          );
        });
      },
      onSelected: handleSelectLanguage,
    );
  }

  Widget _buildLanguageOptionItemText(
    BuildContext context,
    String languageCode,
  ) {
    var t = AppLocalizations.of(context);

    switch (languageCode) {
      case AppSettings.lauguageCodeEn:
        return Text(t!.labelTextLanguageEnglish);
      case AppSettings.lauguageCodeKo:
        return Text(t!.labelTextLanguageKorean);
      default:
        return Text(languageCode); // coverage:ignore-line
    }
  }
}
