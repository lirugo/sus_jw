import 'package:flutter/material.dart';
import 'package:sus_jw/src/stands/stand.dart';

class StandView extends StatelessWidget {
  final Stand stand;
  const StandView({super.key, required this.stand});

  static const routeName = '/stand-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список стендів'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                radius: 20,
                child: Text(
                  '${stand.id}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(stand.name),
              subtitle:
                  stand.description.isNotEmpty ? Text(stand.description) : null,
            ),
            Expanded(
              child: ListView.builder(
                restorationId: 'sampleItemListView',
                itemCount: stand.timeFrames.length,
                itemBuilder: (BuildContext context, int index) {
                  final timeFrame = stand.timeFrames[index];
                  final attendees = stand.findAttendeesByTimeRange(timeFrame);

                  return Card(
                    color: Colors.transparent,
                    elevation: 0,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                        borderRadius:
                            BorderRadius.circular(12), // Rounded corners
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                child: Text(
                                  '${timeFrame.startTime.hour}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
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
                                  padding: const EdgeInsets.all(14),
                                ),
                                onPressed: () {
                                  print('Remove button pressed!');
                                },
                                child: const Icon(
                                  Icons.remove,
                                  size: 24,
                                  color: Colors.white,
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(14),
                                ),
                                onPressed: () {
                                  print('Plus button pressed!');
                                },
                                child: const Icon(
                                  Icons.add,
                                  size: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
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
