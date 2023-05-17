import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_api/models/user/user_info_model.dart';
import 'package:ui_api/repository/app_ui_repository.dart';
import 'package:ui_api/request/user/changepass_request.dart';

import '../../../../base/base_controller.dart';
import '../../../../data/app_data_global.dart';
import '../../../../routes/app_pages.dart';
import '../../../../shared/constants/common.dart';
import '../../../../shared/constants/storage.dart';
import '../../../../shared/utils/dialog_util.dart';

class ChangePassController extends BaseController {
  final _storage = Get.find<SharedPreferences>();

  final userInfo = Rxn<UserInfoModel>();
  final form = GlobalKey<FormState>();
  final _uiRepository = Get.find<AppUIRepository>();

  final TextEditingController currentPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();

  final hideCurrentPassword = true.obs;
  final hideNewPassword = true.obs;

  ChangePassController() {
    userInfo.value = AppDataGlobal.userInfo;
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  Future<void> onSubmit() async {
    if (form.currentState?.validate() ?? false) {
      await EasyLoading.show();
      await _uiRepository
          .changePass(ChangePassRequest(
              currentPassController.text, newPassController.text))
          .then((response) async {
        await EasyLoading.dismiss();
        if (response.isSuccess == CommonConstants.statusOk) {
          await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr,
            message: 'Cập nhật thành công'.tr,
            onPressed: () {
              AppDataGlobal.accessToken = '';
              _storage.setBool(StorageConstants.isLogin, false);
              _storage.setString(StorageConstants.token, '');
              Get.offAllNamed(Routes.LOGIN);
            },
          );
        } else {
          await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr,
            message: response.message ?? 'notify.error'.tr,
          );
        }
      }).catchError((onError) {
        EasyLoading.dismiss();
        DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: 'notify.error'.tr,
        );
      });
    }
  }
}
