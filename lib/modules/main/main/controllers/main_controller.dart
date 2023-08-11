import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../base/base_controller.dart';
import '../../account/controllers/account_controller.dart';
import '../../account/views/account_screen.dart';
import '../../contact/controllers/contact_controller.dart';
import '../../contact/views/contact_screen.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/views/home_screen.dart';
import '../../order_history/controllers/order_history_controller.dart';
import '../../order_history/views/order_history_screen.dart';
import '../../order_home/controllers/order_home_controller.dart';
import '../../order_home/views/order_home_screen.dart';
import '../../price/controllers/price_controller.dart';
import '../../price/views/price_screen.dart';

class MainController extends BaseController {
  Rx<int> index = Rx(0);
  Rx<int> badge = Rx(0);

  List<Widget> tabs = [];
  late HomeController homeController;
  final orderHomeController = OrderHomeController();
  final priceController = PriceController();
  final contactController = ContactController();
  final orderHistoryController = OrderHistoryController();

  final accountController = AccountController();
  // int? tab;

  MainController() {
    homeController = HomeController();
    tabs = [
      HomeScreen(homeController),
      PriceScreen(priceController),
      OrderHomeScreen(orderHomeController),
      ContactScreen(contactController),
      OrderHistoryScreen(orderHistoryController),
      // AccountScreen(accountController),
    ];
  }

  @override
  Future<void> onInit() async {
    await super.onInit();

    await homeController.onInit();
  }

  Future<void> changeIndex(int _index) async {
    if (_index != index.value) {
      if (_index == 0) {
        await homeController.onInit();
      } else if (_index == 1) {
        // await openLink('http://smrvanchuyenquocte.vn/bang-gia');
        await priceController.onInit();
      } else if (_index == 2) {
        await orderHomeController.onInit();
      } else if (_index == 3) {
        await contactController.onInit();
      } else if (_index == 4) {
        orderHistoryController.onRefresh;
      }
    }
    index.value = _index;
  }

  Future<void> openLink(String url) async {
    final _url = Uri.parse(url);
    await launchUrl(_url);
  }
}
