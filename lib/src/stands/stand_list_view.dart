import 'package:flutter/material.dart';
import 'package:sus_jw/src/stands/stand.dart';
import 'package:sus_jw/src/stands/stand_view.dart';

class StandListView extends StatelessWidget {
  StandListView({
    super.key,
    List<Stand>? items,
  }) : items = items ?? [];

  static const routeName = '/stand-list-view';

  final List<Stand> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список стендів'),
      ),
      body: ListView.builder(
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
              title: Text(item.name),
              leading: CircleAvatar(
                radius: 20,
                child: Text(
                  '${item.id}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  StandView.routeName,
                  arguments: item,
                );
              });
        },
      ),
    );
  }
}
