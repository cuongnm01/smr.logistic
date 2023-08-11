import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_api/models/user/user_info_model.dart';
import 'package:ui_api/repository/app_ui_repository.dart';
import 'package:ui_api/request/login/login_request.dart';

import '../../../data/app_data_global.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/constants/storage.dart';
import '../../../shared/services/firebase_cloud_messaging.dart';
import '../../../shared/utils/dialog_util.dart';

class SplashController extends GetxController {
  final _uiRepository = Get.find<AppUIRepository>();
  final storage = Get.find<SharedPreferences>();

  FirebaseMessageConfig config = FirebaseMessageConfig();

  @override
  Future<void> onInit() async {
    super.onInit();

    await config.initFirebaseMessageConfig();
    await config.handleMessage();

    await loadInitSplashScreen();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  Future<void> loadInitSplashScreen() async {
    _loadTheme(storage);
    await _loadMasterData();
    _loadLanguage(storage);

    final isLogin = storage.getBool(StorageConstants.isLogin);
    if (isLogin != null && isLogin) {
      _autoLogin();
    } else {
      await Get.offAndToNamed(Routes.LOGIN);
    }
  }

  void _autoLogin() {
    final username = storage.getString(StorageConstants.username);
    final password = storage.getString(StorageConstants.password);
    _uiRepository
        .login(LoginRequest(
            username: username,
            password: password,
            deviceIdentifier: AppDataGlobal.firebaseToken))
        .then((response) {
      if (response.isSuccess != null &&
          response.isSuccess == CommonConstants.statusOk &&
          response.loginModel != null &&
          response.loginModel!.userInfo != null) {
        AppDataGlobal.accessToken = response.loginModel!.token ?? '';
        _loadData(response.loginModel!.userInfo!);
      } else {
        storage.setBool(StorageConstants.isLogin.toString(), false);
        Get.offAndToNamed(Routes.LOGIN);
      }
    }).catchError((error) {
      Get.offAndToNamed(Routes.LOGIN);
    });
  }

  void _loadLanguage(SharedPreferences storage) {
    final language = storage.getString(StorageConstants.language);
    if (language == null) {
      AppDataGlobal.languageCode = VIETNAMESE_LANG;
      Get.updateLocale(const Locale('vi', 'VN'));
      Get.offAndToNamed(Routes.LANGUAGE);
    } else {
      AppDataGlobal.languageCode = language;

      if (language == VIETNAMESE_LANG) {
        Get.updateLocale(const Locale('vi', 'VN'));
      }
    }
  }

  void _loadTheme(SharedPreferences storage) {
    final theme = storage.getString(StorageConstants.theme);
    if (theme == null || theme == LIGHT_THEME) {
      Get.changeThemeMode(ThemeMode.light);
      storage.setString(StorageConstants.theme, LIGHT_THEME);
      return;
    }

    Get.changeThemeMode(ThemeMode.dark);
    storage.setString(StorageConstants.theme, DARK_THEME);
  }

  Future<void> _loadMasterData() async {
    try {
      await _uiRepository.getShippingType().then((response) {
        if (response.isSuccess == CommonConstants.statusOk &&
            response.data != null) {
          AppDataGlobal.shippingType = response.data!;
        }
      }).catchError((onError) {
        EasyLoading.dismiss();
        DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: 'notify.error'.tr,
        );
      });
      await _uiRepository.getServiceType().then((response) {
        if (response.isSuccess == CommonConstants.statusOk &&
            response.data != null) {
          AppDataGlobal.serviceType = response.data!;
        }
      }).catchError((onError) {
        EasyLoading.dismiss();
        DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: 'notify.error'.tr,
        );
      });
    } catch (e) {
      await EasyLoading.dismiss();
      await DialogUtil.createDialogMessage(
        title: 'notify.title'.tr,
        message: 'notify.error'.tr,
      );
    }
  }

  Future<void> _loadData(UserInfoModel user) async {
    AppDataGlobal.userInfo = user;
    AppDataGlobal.isLogin = true;

    await Get.offAllNamed(Routes.MAIN);
  }
}
