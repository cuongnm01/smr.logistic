import 'package:get/get.dart';
import 'package:app/base/base_binding.dart';
import 'package:app/modules/on_boarding/controller/on_boarding_controller.dart';

class OnBoardingBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<OnBoardingController>(() => OnBoardingController());
  }
}
