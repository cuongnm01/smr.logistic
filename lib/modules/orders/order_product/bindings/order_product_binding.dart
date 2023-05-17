import 'package:get/get.dart';
import '../../../../base/base_binding.dart';
import '../controllers/order_product_controller.dart';

class OrderProductBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<OrderProductController>(() => OrderProductController());
  }
}
