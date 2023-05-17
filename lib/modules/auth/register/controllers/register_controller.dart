import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_api/models/user/login_model.dart';
import 'package:ui_api/repository/app_ui_repository.dart';
import 'package:ui_api/request/register/register_request.dart';

import '../../../../base/base_controller.dart';
import '../../../../data/app_data_global.dart';
import '../../../../resource/assets_constant/icon_constants.dart';
import '../../../../routes/app_pages.dart';
import '../../../../shared/constants/common.dart';
import '../../../../shared/constants/storage.dart';
import '../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../shared/utils/date_util.dart';
import '../../../../shared/utils/dialog_util.dart';
import '../../../../shared/widget/dialog/date_picker.dart';
import '../../../../shared/widget/dialog/normal_widget.dart';


class RegisterController extends BaseController {
  final registerForm = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  DateTime dob = DateTime.now();
  RxString dobText = ''.obs;

  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _uiRepository = Get.find<AppUIRepository>();
  bool showPassword = false;

  final storage = Get.find<SharedPreferences>();
  final hideNewPassword = true.obs;
  final hideRetypePassword = true.obs;

  RegisterController();

  void hideShowNewPassword() {
    hideNewPassword.value = !hideNewPassword.value;
  }

  void hideShowRetypePassword() {
    hideRetypePassword.value = !hideRetypePassword.value;
  }

  Future<void> showDateOptionModalBottomSheet() async {
    await BottomSheetUtil.showBottomSheet(
      child: Container(
        height: Get.height / 1.8,
        child: DatePickerWidget(
          currentDate: dob,
          enableTime: true,
        ),
      ),
      onVaLue: (_value) {
        if (_value != null && _value is DateTime) {
          dob = _value;
          dobText.value = DateUtil.formatDatetimeToString(dob.toUtc(),
              type: DateUtil.DATE_TYPE);
        }
      },
    );
  }

  Future<void> register() async {
    try {
      if (registerForm.currentState?.validate() ?? false) {
        await EasyLoading.show();
        await _uiRepository
            .register(RegisterRequest(
          usernameController.text,
          passwordController.text,
          fullnameController.text,
          phoneController.text,
          emailController.text,
          addressController.text,
          dobText.value,
        ))
            .then((response) {
          if (response.isSuccess == CommonConstants.statusOk) {
            EasyLoading.dismiss();
            DialogUtil.showPopup(
              dialogSize: DialogSize.Popup,
              barrierDismissible: false,
              backgroundColor: Colors.transparent,
              child: NormalWidget(
                icon: IconConstants.icSuccess,
                title: response.message,
              ),
              onVaLue: (value) {
                storage.setString(
                    StorageConstants.username, usernameController.text);
                storage.setString(
                    StorageConstants.password, passwordController.text);
                storage.setBool(StorageConstants.isLogin, true);
                _loadData(response.loginModel!);
              },
            );
          } else {
            EasyLoading.dismiss();
            DialogUtil.showPopup(
              dialogSize: DialogSize.Popup,
              barrierDismissible: false,
              backgroundColor: Colors.transparent,
              child: NormalWidget(
                icon: IconConstants.icFail,
                title: response.message,
              ),
            );
          }

          return;
        });
      }
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> _loadData(LoginModel loginModel) async {
    AppDataGlobal.accessToken = loginModel.token ?? '';
    AppDataGlobal.userInfo = loginModel.userInfo;
    AppDataGlobal.isLogin = true;

    await Get.offAllNamed(Routes.MAIN);
  }
}
