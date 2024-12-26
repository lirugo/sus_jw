import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:sus_jw/src/models/user.dart';
import 'package:sus_jw/src/stands/stand.dart';
import 'package:sus_jw/src/stands/stand_attendee.dart';
import 'package:sus_jw/src/utils/range_constants.dart';
import 'package:table_calendar/table_calendar.dart';

String formatTimeOfDay24H(TimeOfDay timeOfDay) {
  final String hour = timeOfDay.hour.toString().padLeft(2, '0');
  final String minute = timeOfDay.minute.toString().padLeft(2, '0');
  return '$hour:$minute';
}

final kEvents = LinkedHashMap<DateTime, List<Stand>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = {
  for (var item in List.generate(50, (index) => index))
    DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5): List.generate(
      item % 4 + 1,
      (index) => Stand(
          id: index,
          name: 'Stand $index',
          description: 'Description $index',
          date: DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
          timeFrames: [],
          attendees: []),
    ),
}..addAll({
    kToday: [
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
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
