import 'package:sus_jw/src/models/user.dart';
import 'package:sus_jw/src/stands/stand.dart';
import 'package:sus_jw/src/stands/stand_attendee.dart';
import 'package:sus_jw/src/utils/range_constants.dart';

class StandService {
  final List<Stand> _stands = [
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

  StandService();

  Stand getById(int id) {
    return _stands.firstWhere(
      (s) => s.id == id,
      orElse: () => throw Exception('Stand not found for id: $id'),
    );
  }

  // TODO get it from server
  List<Stand> getStands() {
    return _stands;
  }
}
