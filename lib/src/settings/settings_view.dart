import 'package:flutter/material.dart';

import 'settings_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Налаштування'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          child: DropdownButton<ThemeMode>(
            value: controller.themeMode,
            onChanged: controller.updateThemeMode,
            items: const [
              DropdownMenuItem(
                value: ThemeMode.system,
                child: Text('Системна тема'),
              ),
              DropdownMenuItem(
                value: ThemeMode.light,
                child: Text('Світла тема'),
              ),
              DropdownMenuItem(
                value: ThemeMode.dark,
                child: Text('Темна тема'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
