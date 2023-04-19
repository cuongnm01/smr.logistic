
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../base/base_controller.dart';

class PriceController extends BaseController {
  RxString content = ''.obs;
  WebViewController webViewController = WebViewController();

  PriceController();

  @override
  Future<void> onInit() async {
    await super.onInit();

    // webViewController = WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //   // ..setBackgroundColor(const Color(0x00000000))
    //   ..setNavigationDelegate(
    //     NavigationDelegate(
    //       onProgress: (int progress) {
    //         // Update loading bar.
    //       },
    //       onPageStarted: (String url) {},
    //       onPageFinished: (String url) {},
    //       onWebResourceError: (WebResourceError error) {},
    //       onNavigationRequest: (NavigationRequest request) {
    //         if (request.url.startsWith('https://www.youtube.com/')) {
    //           return NavigationDecision.prevent;
    //         }
    //         return NavigationDecision.navigate;
    //       },
    //     ),
    //   )
    //   ..loadRequest(Uri.parse('http://dev-web.smrvanchuyenquocte.vn/bang-gia'));
  }
}
