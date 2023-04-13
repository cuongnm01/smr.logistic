import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/notifications/notification_data.dart';
import 'package:ui_api/models/notifications/notification_model.dart';
import 'package:ui_api/repository/app_ui_repository.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../base/base_controller.dart';
import '../../../data/app_data_global.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/common.dart';
import '../../main/controllers/main_controller.dart';

class NotificationController extends BaseController {
  final _uiRepository = Get.find<AppUIRepository>();

  final MainController mainController;

  final scrollController = ScrollController();
  RxList<NotificationModel> notificationList = RxList<NotificationModel>();
  int limit = CommonConstants.limit;
  int offset = 0;

  NotificationController(this.mainController) {
    //loadData();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels == 0) {
        } else {
          _loadMore();
        }
      }
    });
  }

  @override
  Future<void> onInit() {
    return super.onInit();
  }

  Future<void> loadData() async {
    try {
      await EasyLoading.show();
      await mainController.countNotifyUnread();
      offset = 0;
      await _uiRepository.notificationList(limit, offset).then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.data != null &&
            response.data!.rows != null) {
          if (response.data!.rows!.isNotEmpty) {
            offset = response.data!.rows!.length;
            notificationList.value = response.data!.rows!;
          }
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> _loadMore() async {
    try {
      await EasyLoading.show();
      await _uiRepository.notificationList(limit, offset).then((response) {
        EasyLoading.dismiss();
        if (response.status == CommonConstants.statusOk &&
            response.data != null &&
            response.data!.rows != null) {
          if (response.data!.rows!.isNotEmpty) {
            offset += response.data!.rows!.length;
            notificationList.addAll(response.data!.rows!);
          }
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> reloadBalance() async {
    await _uiRepository.getInfo().then((response) {
      if (response.status == CommonConstants.statusOk &&
          response.data != null &&
          response.data!.info != null) {
        AppDataGlobal.userInfo = response.data!.info!;
      }
    });
  }

  Future<void> viewDetail(
      int id, int displayType, int? invoiceId, String? typeLink) async {
  
  }

  @override
  void onClose() {}
}
