import 'dart:js' as js;
import 'dart:convert';

class TelegramWebApp {
  static final TelegramWebApp _instance = TelegramWebApp._internal();

  late final dynamic telegram;

  factory TelegramWebApp() {
    _instance.telegram = js.context['Telegram']?['WebApp'];
    return _instance;
  }

  TelegramWebApp._internal();

  String? getUser() {
    if (telegram != null && telegram['initDataUnsafe'] != null) {
      final user = telegram['initDataUnsafe']['user'];
      if (user != null) {
        return json.encode(user.toString());
      }
    }
    return null;
  }

  String? getUserId() {
    if (telegram != null && telegram['initDataUnsafe']?['user'] != null) {
      return telegram['initDataUnsafe']['user']['id'].toString();
    }
    return null;
  }
}
