import 'package:sus_jw/src/stands/stand_attendee.dart';
import 'package:sus_jw/src/model/time_range.dart';

class Stand {
  final int id;
  final String name;
  final String description;
  final DateTime date;
  final List<TimeRange> timeFrames;
  final List<StandAttendee> attendees;

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
}
