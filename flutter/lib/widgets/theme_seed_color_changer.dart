import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../change_notifiers/app_settings_change_notifier.dart';
import '../constants/app_colors.dart';

const List<Color> colorOptions = [
  AppColors.seedColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

const List<String> colorText = <String>[
  'App seed color',
  'Blue',
  'Teal',
  'Green',
  'Yellow',
  'Orange',
  'Pink',
];

class ThemeSeedColorChanger extends StatelessWidget {
  const ThemeSeedColorChanger({super.key});

  @override
  Widget build(BuildContext context) {
    Color appThemeSeedColor = context.select(
      (AppSettingsChangeNotifier appSettingsChangeNotifier) =>
          appSettingsChangeNotifier.themeSeedColor,
    );

    Future<void> handleColorSelect(int value) async {
      final appSettingsChangeNotifier =
          context.read<AppSettingsChangeNotifier>();
      await appSettingsChangeNotifier.setThemeSeedColor(colorOptions[value]);
    }

    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (context) {
        return List.generate(colorOptions.length, (index) {
          return PopupMenuItem(
            value: index,
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    colorOptions[index].value == appThemeSeedColor.value
                        ? Icons.color_lens
                        : Icons.color_lens_outlined,
                    color: colorOptions[index],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(colorText[index]),
                ),
              ],
            ),
          );
        });
      },
      onSelected: handleColorSelect,
    );
  }
}
