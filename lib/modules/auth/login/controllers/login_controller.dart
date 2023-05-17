import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_api/models/user/login_model.dart';
import 'package:ui_api/repository/app_ui_repository.dart';
import 'package:ui_api/request/login/login_request.dart';

import '../../../../base/base_controller.dart';
import '../../../../data/app_data_global.dart';
import '../../../../resource/assets_constant/icon_constants.dart';
import '../../../../routes/app_pages.dart';
import '../../../../shared/constants/common.dart';
import '../../../../shared/constants/storage.dart';
import '../../../../shared/utils/dialog_util.dart';
import '../../../../shared/widget/dialog/normal_widget.dart';

class LoginController extends BaseController {
  final _uiRepository = Get.find<AppUIRepository>();

  final formLogin = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool hidePassword = true.obs;

  final storage = Get.find<SharedPreferences>();

  @override
  Future<void> onInit() {
    final error = Get.arguments;
    if (error is String && error.isNotEmpty) {
      EasyLoading.showToast(error);
    }

    return super.onInit();
  }

  @override
  void onReady() {
    usernameController.text =
        storage.getString(StorageConstants.username) ?? '';
    passwordController.text = '';
    return super.onReady();
  }

  @override
  void onClose() {}

  Future<void> onLogin() async {
    // await Get.toNamed(Routes.MAIN);
    if (formLogin.currentState?.validate() ?? false) {
      await EasyLoading.show();
      hideKeyboard(Get.overlayContext!);
      await login();
    }
  }

  Future<void> login() async {
    await _uiRepository
        .login(LoginRequest(
            username: usernameController.text,
            password: passwordController.text,
            deviceIdentifier: AppDataGlobal.firebaseToken))
        .then((response) {
      if (response.isSuccess == CommonConstants.statusOk &&
          response.loginModel != null &&
          response.loginModel!.userInfo != null) {
        EasyLoading.dismiss();
        storage.setString(StorageConstants.username, usernameController.text);
        storage.setString(StorageConstants.password, passwordController.text);
        storage.setBool(StorageConstants.isLogin, true);

        _loadData(response.loginModel!);
      } else {
        EasyLoading.dismiss();
        DialogUtil.showPopup(
          dialogSize: DialogSize.Popup,
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          child: NormalWidget(
            icon: response.isSuccess == CommonConstants.statusOk
                ? IconConstants.icPassSuccess
                : IconConstants.icFail,
            title: response.message,
          ),
          onVaLue: (value) {},
        );
      }
    }).catchError(
      (onError) {
        EasyLoading.dismiss();
      },
    );
  }

  Future<void> loadData() async {}

  Future<void> signin() async {
    await Get.toNamed(Routes.REGISTER);
  }

  Future<void> forgorPassword() async {
    await Get.toNamed(Routes.FORGOT_PASSWORD);
  }

  Future<void> _loadData(LoginModel loginModel) async {
    AppDataGlobal.accessToken = loginModel.token ?? '';
    AppDataGlobal.userInfo = loginModel.userInfo;
    AppDataGlobal.isLogin = true;

    await Get.offAllNamed(Routes.MAIN);
  }

  void hideShowPassword() {
    hidePassword.value = !hidePassword.value;
    log('Value: ${hidePassword.value}');
  }

  void hideKeyboard(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
