import 'package:flutter/material.dart';
import 'package:sus_jw/src/stands/stand.dart';
import 'package:sus_jw/src/stands/stand_view.dart';
import 'package:sus_jw/src/utils/utils.dart';
import 'package:table_calendar/table_calendar.dart';

class StandCalendarView extends StatefulWidget {
  const StandCalendarView({super.key});

  static const String routeName = '/stands';

  @override
  State<StandCalendarView> createState() => _StandCalendarViewState();
}

class _StandCalendarViewState extends State<StandCalendarView> {
  late final ValueNotifier<List<Stand>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.week;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Stand> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  List<Stand> _getEventsForRange(DateTime start, DateTime end) {
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null;
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  void _onStandSelected(Stand stand) {
    Navigator.pushNamed(context, '${StandView.routeName}/${stand.id}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Розклад стендів'),
      ),
      body: Column(
        children: [
          TableCalendar<Stand>(
            locale: 'uk_UA',
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: const CalendarStyle(
              outsideDaysVisible: false,
            ),
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, date, eventsForDay) {
                if (eventsForDay.isNotEmpty) {
                  return Positioned(
                    bottom: 5,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        '${eventsForDay.length}/10', // TODO calc amount empty stands
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                      ),
                    ),
                  );
                }
                return null;
              },
            ),
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<Stand>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    final stand = value[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                      child: ListTile(
                        onTap: () => _onStandSelected(stand),
                        title: Text(
                            '${stand.getStartAndEndTimes()} ${stand.name}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
