import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:sus_jw/src/stands/stand_list_view.dart';

class StandWeekView extends StatelessWidget {
  const StandWeekView({super.key});

  static const routeName = '/stand-week-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Графік стенду'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: HeatMapCalendar(
          datasets: {
            DateTime(2024, 12, 6): 1,
            DateTime(2024, 12, 7): 2,
            DateTime(2024, 12, 8): 3,
            DateTime(2024, 12, 9): 4,
            DateTime(2024, 12, 10): 5,
          },
          colorMode: ColorMode.color,
          colorsets: {
            0: Colors.transparent,
            1: Colors.red.shade100,
            2: Colors.yellow.shade200,
            3: Colors.yellow.shade300,
            4: Colors.green.shade200,
            5: Colors.green.shade400,
          },
          onClick: (value) {
            Navigator.restorablePushNamed(
              context,
              StandListView.routeName,
            );
          },
        ),
      ),
    );
  }
}
