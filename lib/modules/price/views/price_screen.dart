import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../shared/constants/colors.dart';
import '../../../../shared/styles/text_style/text_style.dart';
import '../controllers/price_controller.dart';

class PriceScreen extends GetView<PriceController> {
  @override
  final PriceController controller;

  WebViewController webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('http://dev-web.smrvanchuyenquocte.vn/bang-gia'));

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
      body: WebViewWidget(controller: webViewController),
    );
  }
}
