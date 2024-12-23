import 'package:flutter/material.dart';
import 'package:sus_jw/src/stands/stand_calendar_view.dart';

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

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 4.0,
            ),
            child: ListTile(
              title: Text(item.name),
              leading: CircleAvatar(
                radius: 16,
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                child: Text(
                  '${item.id}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () {
                Navigator.restorablePushNamed(
                    context, StandCalendarView.routeName);
              },
            ),
          );
        },
      ),
    );
  }
}
