import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:sus_jw/src/models/user.dart';
import 'package:sus_jw/src/telegram/telegram_web_app.dart';

class UserService {
  static User getAuthTgUser() {
    return TelegramWebApp.getTelegramUser();
  }

  Future<bool> isUserAuthorized(String username) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('allowed_users')
        .doc(username)
        .get();

    return snapshot.exists;
  }
}
