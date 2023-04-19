import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../shared/constants/colors.dart';
import '../../../../shared/styles/text_style/text_style.dart';
import '../controllers/price_controller.dart';

class PriceScreen extends GetView<PriceController> {
  @override
  final PriceController controller;

  PriceScreen(this.controller);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leading: Container(),
        title: Text(
          'Báo giá',
          style: AppTextStyle.heavy(color: Colors.white),
        ),
        elevation: 1,
        backgroundColor: AppColor.primaryColor,
      ),
      body:  WebViewWidget(controller: controller.webViewController),
    );
  }
}
