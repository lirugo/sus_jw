import 'package:flutter/material.dart';
import 'package:sus_jw/src/stands/stand_service.dart';

class StandView extends StatelessWidget {
  final int id;
  const StandView({super.key, required this.id});

  static const routeName = '/stands-view';

  @override
  Widget build(BuildContext context) {
    final standService = StandService();
    final stand = standService.getById(id);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Розклад стенду'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10), // Rounded corners for the card
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0), // Padding inside the card
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stand.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (stand.description.isNotEmpty)
                            Text(
                              stand.description,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: stand.timeFrames.length,
                itemBuilder: (BuildContext context, int index) {
                  final timeFrame = stand.timeFrames[index];
                  final attendees = stand.findAttendeesByTimeRange(timeFrame);

                  return Card(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    elevation: 0,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${timeFrame.startTime.hour.toString().padLeft(2, '0')}:${timeFrame.startTime.minute.toString().padLeft(2, '0')} - ${timeFrame.endTime.hour.toString().padLeft(2, '0')}:${timeFrame.endTime.minute.toString().padLeft(2, '0')}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                ),
                                onPressed: () {
                                  print('Remove button pressed!');
                                },
                                child: const Icon(
                                  Icons.remove,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                ),
                                onPressed: () {
                                  print('Plus button pressed!');
                                },
                                child: const Icon(
                                  Icons.add,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          ...attendees.map((attendee) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Text(
                                  attendee.user.firstName,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              )),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
