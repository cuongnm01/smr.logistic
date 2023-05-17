import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../../base/base_controller.dart';

class PriceController extends BaseController {
  RxString content = ''.obs;

  PriceController();

  @override
  Future<void> onInit() async {
    await super.onInit();
  }
}
