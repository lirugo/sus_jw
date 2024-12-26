import 'package:flutter/material.dart';
import 'package:sus_jw/src/users/user_service.dart';

import 'settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    final user = UserService.getAuthTgUser();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Налаштування'),
      ),
      body: Card(
        margin: const EdgeInsets.all(16),
        color: Theme.of(context).colorScheme.primaryContainer,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: TextEditingController(text: user.firstName),
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Ім\'я',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: TextEditingController(text: user.lastName),
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Прізвище',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: TextEditingController(text: user.username),
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Нік',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller:
                    TextEditingController(text: user.isBot! ? 'Так' : 'Ні'),
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Бот',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller:
                    TextEditingController(text: user.isPremium! ? 'Так' : 'Ні'),
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Преміум',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<ThemeMode>(
                value: controller.themeMode,
                onChanged: controller.updateThemeMode,
                decoration: const InputDecoration(
                  labelText: 'Тема',
                  border: OutlineInputBorder(),
                ),
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
                  ),
                ],
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: 'Київ-Західний',
                onChanged: (value) => {},
                decoration: const InputDecoration(
                  labelText: 'Збір',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Київ-Західний',
                    child: Text('Київ-Західний'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
