import 'package:get/get.dart';
import 'package:app/base/base_binding.dart';
import 'package:app/modules/main/controllers/main_controller.dart';

class MainBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<MainController>(() => MainController());
  }
}
