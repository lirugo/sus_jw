import 'dart:convert';
import 'dart:js' as js;

import 'package:sus_jw/src/models/user.dart';

class TelegramWebApp {
  static String getRawInitData() {
    return js.context.callMethod('getTelegramInitData') as String;
  }

  static Map<String, dynamic> parseInitData(String initData) {
    final Map<String, String> rawData = Uri.splitQueryString(initData);

    final Map<String, dynamic> data = {};
    rawData.forEach((key, value) {
      if (key == 'user') {
        data[key] = json.decode(Uri.decodeComponent(value));
      } else {
        data[key] = Uri.decodeComponent(value);
      }
    });

    return data;
  }

  static User getTelegramUser() {
    final initData = getRawInitData();
    final map = parseInitData(initData);
    return User.fromInitData(map);
  }
}
