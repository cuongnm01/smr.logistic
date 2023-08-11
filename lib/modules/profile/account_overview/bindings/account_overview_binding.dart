import 'package:get/get.dart';
import '../../../../base/base_binding.dart';
import '../controllers/account_overview_controller.dart';

class AccountOverviewBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<AccountOverviewController>(() => AccountOverviewController());
  }
}
