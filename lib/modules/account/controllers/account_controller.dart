import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_api/models/user/user_info_model.dart';
import 'package:ui_api/repository/app_ui_repository.dart';

import '../../../base/base_controller.dart';
import '../../../data/app_data_global.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/storage.dart';
import '../../../shared/utils/dialog_util.dart';
import '../../../shared/widget/dialog/logout_widget.dart';

class AccountController extends BaseController {
  final _storage = Get.find<SharedPreferences>();
  final userInfo = Rxn<UserInfoModel>();

  AccountController();

  @override
  Future<void> onInit() async {
    await super.onInit();
    userInfo.value = AppDataGlobal.userInfo;
  }

  Future<void> loadData() async {}

  Future<void> updateInfo() async {}

  Future<void> onLogout() async {
    await DialogUtil.showPopup(
      dialogSize: DialogSize.Popup,
      barrierDismissible: false,
      backgroundColor: Colors.transparent,
      child: const LogoutWidget(),
      onVaLue: (_value) {
        if (_value != null && _value is int) {
          if (_value == 1) {
            AppDataGlobal.accessToken = '';
            _storage.setBool(StorageConstants.isLogin, false);
            _storage.setString(StorageConstants.token, '');
            Get.offAllNamed(Routes.LOGIN);
          }
        }
      },
    );
  }
}
