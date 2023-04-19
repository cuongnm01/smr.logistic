import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/home/home_model.dart';
import 'package:ui_api/models/home/services_model.dart';
import 'package:ui_api/models/home/slider_model.dart';
import 'package:ui_api/models/user/user_info_model.dart';
import 'package:ui_api/repository/app_ui_repository.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../base/base_controller.dart';
import '../../../data/app_data_global.dart';
import '../../../routes/app_pages.dart';

class HomeController extends BaseController {
  final Rx<int> currentStatus = Rx(0);
  final Rx<int> badgeChatAdmin = Rx(0);
  final Rx<int> bottomIndex = Rx(0);

  final homeModel = Rx(HomeModel());

  final userInfo = Rxn<UserInfoModel>();

  HomeController();

  @override
  Future<void> onInit() async {
    await super.onInit();
    userInfo.value = AppDataGlobal.userInfo;
  }

  Future<void> loadData() async {
    try {
      // userInfo.value = AppDataGlobal.userInfo;
      // await _uiRepository.home().then((response) {
      //   if (response.status == CommonConstants.statusOk &&
      //       response.homeModel != null) {
      //     homeModel.value = response.homeModel!;

      //     return;
      //   }
      // });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future onTopup() async {}

  Future<void> viewDetail(int id) async {}

  Future<void> viewProfile() async {}

  //goto service page
  Future<void> viewService(ServiceModel item) async {}

  Future<void> supplierDetail() async {}

  Future<void> viewAllSuppliers() async {}

  Future<void> viewAllNews() async {
    await Get.toNamed(Routes.NEWS_LIST);
  }

  Future<void> viewNews(int id) async {}

  Future<void> actContinue(int id) async {}

  Future<void> registerConsulting() async {}

  Future<void> onChatAdmin() async {}

  Future<void> routerSlider(SliderModel item) async {}

  Future<void> openLink(String url) async {
    final _url = Uri.parse(url);
    await launchUrl(_url);
  }
}
