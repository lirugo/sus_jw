import 'package:flutter/material.dart';
import 'package:sus_jw/src/stands/stand_week_view.dart';

import '../settings/settings_view.dart';
import 'meeting.dart';

class MeetingsListView extends StatelessWidget {
  const MeetingsListView({
    super.key,
    this.items = const [Meeting(1, "Київ-Західний")],
  });

  static const routeName = '/';

  final List<Meeting> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список зібрань'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
              title: Text(item.name),
              leading: CircleAvatar(
                radius: 20,
                child: Text(
                  '${item.id}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () {
                Navigator.restorablePushNamed(context, StandWeekView.routeName);
              });
        },
      ),
    );
  }
}
