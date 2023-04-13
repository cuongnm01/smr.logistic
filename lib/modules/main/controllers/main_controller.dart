import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/notifications/notification_data.dart';
import 'package:ui_api/repository/app_ui_repository.dart';

import '../../../base/base_controller.dart';
import '../../../data/app_data_global.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/common.dart';
import '../../account/controllers/account_controller.dart';
import '../../account/views/account_screen.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/views/home_screen.dart';
import '../../news/controllers/news_controller.dart';
import '../../news/views/news_screen.dart';
import '../../notification/controllers/notification_controller.dart';
import '../../notification/views/notification_screen.dart';

class MainController extends BaseController {
  final _uiRepository = Get.find<AppUIRepository>();

  Rx<int> index = Rx(0);
  Rx<int> badge = Rx(0);

  List<Widget> tabs = [];
  late HomeController homeController;
  late NotificationController notificationController;
  final newsController = NewsController();
  final accountController = AccountController();
  // int? tab;

  MainController() {
    homeController = HomeController();
    notificationController = NotificationController(this);
    tabs = [
      HomeScreen(homeController),
      HomeScreen(homeController),
      NotificationScreen(notificationController),
      NewsScreen(newsController),
      AccountScreen(accountController),
    ];

    // if (tab != null) {
    //   changeIndex(1);
    // }
  }

  @override
  Future<void> onInit() async {
    await super.onInit();

    await homeController.loadData();
    await countNotifyUnread();
  }

  Future<void> changeIndex(int _index) async {
    if (_index != index.value) {
      if (_index == 0) {
        await homeController.loadData();
      } else if (_index == 1) {
        await homeController.loadData();
      } else if (_index == 2) {
        await notificationController.loadData();
      } else if (_index == 3) {
        await newsController.loadNewsList();
      } else if (_index == 4) {
        await accountController.loadData();
      }
    }
    index.value = _index;

    await countNotifyUnread();
  }

  Future<void> countNotifyUnread() async {
  }

  Future<void> onChat(String channelId) async {
    await EasyLoading.dismiss();
  }
}
