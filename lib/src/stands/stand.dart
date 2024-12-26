import 'package:flutter/material.dart';
import 'package:sus_jw/src/stands/stand_attendee.dart';
import 'package:sus_jw/src/models/time_range.dart';
import 'package:sus_jw/src/utils/utils.dart';

class Stand {
  final int id;
  final String name;
  final String description;
  final DateTime date;
  final List<TimeRange> timeFrames;
  final List<StandAttendee> attendees;
  static const maxAttendees = 5;

  const Stand(
      {required this.id,
      required this.name,
      required this.description,
      required this.date,
      required this.timeFrames,
      required this.attendees});

  List<StandAttendee> findAttendeesByTimeRange(TimeRange range) {
    return attendees.where((attendee) {
      return attendee.timeRange.startTime == range.startTime &&
          attendee.timeRange.endTime == range.endTime;
    }).toList();
  }

  String findAttendeeNamesByTimeRange(TimeRange range) {
    return findAttendeesByTimeRange(range)
        .map((attendee) => attendee.user.firstName)
        .join(', ');
  }

  String getStartAndEndTimes() {
    if (timeFrames.isEmpty) {
      return '[00:00]';
    }

    // Find the earliest start time
    TimeOfDay earliestStart = timeFrames.first.startTime;
    TimeOfDay latestEnd = timeFrames.first.endTime;

    for (var timeRange in timeFrames) {
      if (_isEarlier(timeRange.startTime, earliestStart)) {
        earliestStart = timeRange.startTime;
      }
      if (_isLater(timeRange.endTime, latestEnd)) {
        latestEnd = timeRange.endTime;
      }
    }

    return '[${formatTimeOfDay24H(earliestStart)} - ${formatTimeOfDay24H(latestEnd)}]';
  }

  // Helper method to compare times
  static bool _isEarlier(TimeOfDay a, TimeOfDay b) {
    return a.hour < b.hour || (a.hour == b.hour && a.minute < b.minute);
  }

  static bool _isLater(TimeOfDay a, TimeOfDay b) {
    return a.hour > b.hour || (a.hour == b.hour && a.minute > b.minute);
  }
}
