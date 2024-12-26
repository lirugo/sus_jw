import 'package:flutter/material.dart';
import 'package:sus_jw/src/sign_in/sign_in.dart';

import 'meetings/meetings_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';
import 'stands/stand_calendar_view.dart';
import 'stands/stand_list_view.dart';
import 'stands/stand_view.dart';

class AppRouter {
  static Widget _errorRoute(String message) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(child: Text(message)),
    );
  }

  static Route<dynamic> onGenerateRoute(
    RouteSettings routeSettings, {
    required SettingsController settingsController,
  }) {
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) {
        if (routeSettings.name != null &&
            routeSettings.name!.startsWith(StandView.routeName)) {
          final uri = Uri.parse(routeSettings.name!);
          if (uri.pathSegments.length == 2 &&
              uri.pathSegments[0] == StandView.routeName.replaceAll('/', '')) {
            final id = uri.pathSegments[1];
            return StandView(id: int.parse(id));
          } else {
            return _errorRoute('Invalid route: ${routeSettings.name}');
          }
        } else {
          switch (routeSettings.name) {
            case SettingsView.routeName:
              return SettingsView(controller: settingsController);
            case StandCalendarView.routeName:
              return const StandCalendarView();
            case MeetingsListView.routeName:
              return const MeetingsListView();
            case StandListView.routeName:
              return StandListView();
            case SignInView.routeName:
              return SignInView();

            default:
              return SignInView();
          }
        }
      },
    );
  }
}
