import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/user/user_info_model.dart';
import 'package:ui_api/repository/app_ui_repository.dart';
import 'package:ui_api/request/user/update_info_request.dart';

import '../../../../base/base_controller.dart';
import '../../../../data/app_data_global.dart';
import '../../../../shared/constants/common.dart';
import '../../../../shared/utils/dialog_util.dart';

class ProfileUpdateController extends BaseController {
  final userInfo = Rxn<UserInfoModel>();
  final form = GlobalKey<FormState>();
  final _uiRepository = Get.find<AppUIRepository>();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  ProfileUpdateController() {
    userInfo.value = AppDataGlobal.userInfo;
    phoneController.text = userInfo.value?.phoneNumber ?? '';
    nameController.text = userInfo.value?.fullName ?? '';
    emailController.text = userInfo.value?.email ?? '';
    addressController.text = userInfo.value?.address ?? '';
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  Future<void> onSubmit() async {
    if (form.currentState?.validate() ?? false) {
      await EasyLoading.show();
      await _uiRepository
          .updateInfo(UpdateInfoRequest(
              fullName: nameController.text,
              phoneNumber: phoneController.text,
              email: emailController.text,
              address: addressController.text))
          .then((response) async {
        await EasyLoading.dismiss();
        if (response.isSuccess == CommonConstants.statusOk) {
          await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr,
            message: 'Cập nhật thành công'.tr,
            onPressed: () {
              AppDataGlobal.userInfo = response.data;
              userInfo.value = AppDataGlobal.userInfo;
              userInfo.refresh();
              Get.back();
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
