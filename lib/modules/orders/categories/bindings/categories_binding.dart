import 'package:get/get.dart';
import '../../../../base/base_binding.dart';
import '../controllers/categories_controller.dart';

class CategoriesBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<CategoriesController>(() => CategoriesController());
  }
}
