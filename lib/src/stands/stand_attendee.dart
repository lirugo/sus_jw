import 'package:sus_jw/src/model/time_range.dart';
import 'package:sus_jw/src/model/user.dart';

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
