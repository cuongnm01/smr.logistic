import 'package:get/get.dart';
import 'package:ui_api/models/user/user_info_model.dart';

import '../../../base/base_controller.dart';
import '../../../data/app_data_global.dart';

class ProfileController extends BaseController {
  final userInfo = Rxn<UserInfoModel>();

  ProfileController();

  @override
  Future<void> onInit() async {
    await super.onInit();
    userInfo.value = AppDataGlobal.userInfo;
  }
}
