import 'package:get/get.dart';
import '../../../../base/base_binding.dart';
import '../controllers/order_history_controller.dart';

class OrderHistoryBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<OrderHistoryController>(() => OrderHistoryController());
  }
}
