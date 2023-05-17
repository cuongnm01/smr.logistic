import 'package:get/get.dart';
import '../../../../base/base_binding.dart';
import '../controllers/products_controller.dart';

class ProductsBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<ProductsController>(() => ProductsController());
  }
}
