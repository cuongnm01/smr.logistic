import 'package:get/get.dart';
import 'package:ui_api/models/user/user_info_model.dart';

import '../../../../base/base_controller.dart';
import '../../../../data/app_data_global.dart';
import '../../../../routes/app_pages.dart';

class ProfileController extends BaseController {
  final userInfo = Rxn<UserInfoModel>();

  ProfileController() {
    userInfo.value = AppDataGlobal.userInfo;
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  Future<void> onUpdate() async {
    await Get.toNamed(Routes.PROFILE_UPDATE)?.then((value) {
      userInfo.value = AppDataGlobal.userInfo;
    });
  }
}
