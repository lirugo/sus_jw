import 'package:flutter/material.dart';
import 'package:sus_jw/src/stands/stand_calendar_view.dart';
import 'package:sus_jw/src/telegram/telegram_web_app.dart';
import '../settings/settings_view.dart';
import 'meeting.dart';

class MeetingsListView extends StatefulWidget {
  const MeetingsListView({
    super.key,
    this.items = const [Meeting(1, "Київ-Західний")],
  });

  static const routeName = '/';

  final List<Meeting> items;

  @override
  State<MeetingsListView> createState() => _MeetingsListViewState();
}

class _MeetingsListViewState extends State<MeetingsListView> {
  @override
  Widget build(BuildContext context) {
    TelegramWebApp.getTelegramUser();
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
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = widget.items[index];

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
