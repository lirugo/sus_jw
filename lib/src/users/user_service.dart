import 'dart:convert';
import 'dart:js' as js;

import 'package:sus_jw/src/models/user.dart';
import 'package:sus_jw/src/telegram/telegram_web_app.dart';

class UserService {
  static User getAuthTgUser() {
    return TelegramWebApp.getTelegramUser();
  }
}
