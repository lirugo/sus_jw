import 'package:flutter/material.dart';
import 'package:sus_jw/src/model/user.dart';
import 'package:sus_jw/src/range_constants.dart';
import 'package:sus_jw/src/stands/stand.dart';
import 'package:sus_jw/src/stands/stand_attendee.dart';
import 'package:sus_jw/src/stands/stand_view.dart';
import 'package:sus_jw/src/model/time_range.dart';

import '../settings/settings_view.dart';

class StandListView extends StatelessWidget {
  StandListView({
    super.key,
    List<Stand>? items,
  }) : items = items ??
            [
              Stand(
                  id: 1,
                  name: "Академмістечко метро",
                  description: '',
                  date: DateTime.now(),
                  timeFrames: [],
                  attendees: []),
              Stand(
                  id: 2,
                  name: "Академмістечко (Новус)",
                  description: 'Стенди біля Новусу та Макдональдса',
                  date: DateTime.now(),
                  timeFrames: [
                    RangeConstants.RANGE_8,
                    RangeConstants.RANGE_9,
                  ],
                  attendees: [
                    StandAttendee(
                      timeRange: RangeConstants.RANGE_8,
                      user: User(
                        id: 1,
                        firstName: 'Іванов Іван Іванович',
                      ),
                    ),
                    StandAttendee(
                      timeRange: RangeConstants.RANGE_9,
                      user: User(
                        id: 1,
                        firstName: 'Іванов Іван Іванович',
                      ),
                    ),
                    StandAttendee(
                      timeRange: RangeConstants.RANGE_8,
                      user: User(
                        id: 1,
                        firstName: 'Петров Петро Петрович',
                      ),
                    ),
                    StandAttendee(
                      timeRange: RangeConstants.RANGE_8,
                      user: User(
                        id: 1,
                        firstName: 'Сергей Сергеевич Сергеев',
                      ),
                    ),
                    StandAttendee(
                      timeRange: RangeConstants.RANGE_9,
                      user: User(
                        id: 1,
                        firstName: 'Сергей Сергеевич Сергеев',
                      ),
                    ),
                  ]),
              Stand(
                  id: 3,
                  name: "Бузова",
                  description: '',
                  date: DateTime.now(),
                  timeFrames: [],
                  attendees: []),
              Stand(
                  id: 4,
                  name: "Академмістечко метро",
                  description: '',
                  date: DateTime.now(),
                  timeFrames: [],
                  attendees: []),
              Stand(
                  id: 5,
                  name: "Дачна (Варус)",
                  description: '',
                  date: DateTime.now(),
                  timeFrames: [],
                  attendees: []),
              Stand(
                  id: 6,
                  name: "Дачна",
                  description: '',
                  date: DateTime.now(),
                  timeFrames: [],
                  attendees: []),
              Stand(
                  id: 7,
                  name: "Велмарт",
                  description: '',
                  date: DateTime.now(),
                  timeFrames: [],
                  attendees: []),
              Stand(
                  id: 8,
                  name: "Чайки",
                  description: '',
                  date: DateTime.now(),
                  timeFrames: [],
                  attendees: []),
            ];

  static const routeName = '/stand-list-view';

  final List<Stand> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список стендів'),
      ),
      body: ListView.builder(
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
              title: Text('${item.name}'),
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
                Navigator.pushNamed(
                  context,
                  StandView.routeName,
                  arguments: item,
                );
              });
        },
      ),
    );
  }
}
