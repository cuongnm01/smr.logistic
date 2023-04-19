import 'dart:developer';

import '../../data/app_data_global.dart';

class ChatUtil {
  static Future<void> initChat(String apiKey) async {
    try {} catch (e) {
      log('[ChatUtil] create chat error ${e.toString()}');
    }
  }
}
