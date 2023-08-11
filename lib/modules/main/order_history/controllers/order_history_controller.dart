import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:ui_api/models/order/order.dart';
import 'package:ui_api/repository/app_ui_repository.dart';

import '../../../../base/base_controller.dart';
import '../../../../routes/app_pages.dart';
import '../../../../shared/constants/common.dart';
import '../../../../shared/utils/dialog_util.dart';

class OrderHistoryController extends BaseController {
  final _uiRepository = Get.find<AppUIRepository>();

  final scrollController = ScrollController();
  RxList<Order> listData = RxList<Order>();

  final allRefreshController = RefreshController();
  final isMore = RxBool(true);
  int _pageAll = 0;

  final TextEditingController keyword = TextEditingController();

  OrderHistoryController() {
    onRefresh();
  }

  void onRefresh() => _loadData(0);
  void onLoading() => _loadData(_pageAll + 1);

  void _updateRefreshController(int page, {bool isError = false}) {
    if (page == 0) {
      isError
          ? allRefreshController.refreshFailed()
          : allRefreshController.refreshCompleted();
    } else {
      isError
          ? allRefreshController.loadFailed()
          : allRefreshController.loadComplete();
    }
  }

  Future<void> _loadData(int page) async {
    try {
      await EasyLoading.show();
      await _uiRepository.getOrders().then((response) async {
        if (response.isSuccess == CommonConstants.statusOk) {
          _updateRefreshController(page);
          if (page == 0) {
            listData.clear();
          }

          final orders = response.data?.data ?? [];
          await Future.forEach(orders, (Order item) async {
            listData.add(item);
          });
          _pageAll = page;
          isMore.value = (page + 1) < response.data!.totalPaging!;
          await EasyLoading.dismiss();
        } else {
          _updateRefreshController(page, isError: true);
          await EasyLoading.dismiss();
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr,
              message: response.message ?? 'notify.error'.tr);
        }
      }).catchError((onError) {
        _updateRefreshController(page, isError: true);
        EasyLoading.dismiss();
        DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: 'notify.error'.tr);
      });
    } catch (e) {
      await EasyLoading.dismiss();
      await DialogUtil.createDialogMessage(
        title: 'notify.title'.tr,
        message: 'notify.error'.tr,
      );
    }
  }

  Future<void> onViewDetail(Order item) async {
    await Get.toNamed(Routes.ORDER_HISTORY_DETAIL, arguments: item);
  }
}
