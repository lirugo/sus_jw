import 'package:sus_jw/src/models/time_range.dart';
import 'package:sus_jw/src/models/user.dart';

class StandAttendee {
  final TimeRange timeRange;
  final User user;

  StandAttendee({
    required this.timeRange,
    required this.user,
  });

  @override
  String toString() {
    return 'User: $user, TimeRange: $timeRange';
  }
}
