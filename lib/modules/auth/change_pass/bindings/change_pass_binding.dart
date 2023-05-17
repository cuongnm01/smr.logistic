import 'package:get/get.dart';
import '../../../../base/base_binding.dart';
import '../controllers/change_pass_controller.dart';

class ChangePassBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<ChangePassController>(() => ChangePassController());
  }
}
