import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/order/order.dart';
import 'package:ui_api/repository/app_ui_repository.dart';

import '../../../../base/base_controller.dart';
import '../../../../data/app_data_global.dart';
import '../../../../shared/constants/common.dart';
import '../../../../shared/utils/dialog_util.dart';

class OrderHistoryDetailController extends BaseController {
  final _uiRepository = Get.find<AppUIRepository>();

  Rx<Order> order = Rx(Order());

  OrderHistoryDetailController() {
    order.value = Get.arguments;
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      await EasyLoading.show();
      await _uiRepository
          .getOrderDetail(order.value.id ?? '')
          .then((response) async {
        if (response.isSuccess == CommonConstants.statusOk &&
            response.data != null) {
          order.value = response.data!;
          order.refresh();
          await EasyLoading.dismiss();
        } else {
          await EasyLoading.dismiss();
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr,
              message: response.message ?? 'notify.error'.tr);
        }
      }).catchError((onError) {
        EasyLoading.dismiss();
        DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: 'notify.error'.tr);
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  String ServiceTypeString() {
    var name = '';
    if (AppDataGlobal.serviceType != null) {
      try {
        name = AppDataGlobal.serviceType!
                .firstWhere((e) => e.type == order.value.serviceType)
                .name ??
            '';
      } catch (e) {}
    }
    return name;
  }

  String ShippingTypeString() {
    var name = '';
    if (AppDataGlobal.shippingType != null) {
      try {
        name = AppDataGlobal.shippingType!
                .firstWhere((e) => e.type == order.value.shippingType)
                .name ??
            '';
      } catch (e) {}
    }
    return name;
  }
}
