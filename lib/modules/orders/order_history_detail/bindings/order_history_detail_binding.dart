import 'package:get/get.dart';
import '../../../../base/base_binding.dart';
import '../controllers/order_history_detail_controller.dart';

class OrderHistoryDetailBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<OrderHistoryDetailController>(() => OrderHistoryDetailController());
  }
}
