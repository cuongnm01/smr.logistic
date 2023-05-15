import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ui_api/models/order/order.dart';

import '../../../../shared/constants/colors.dart';
import '../../../../shared/styles/text_style/text_style.dart';
import '../../../../shared/utils/date_util.dart';
import '../../../../shared/widget/widget_scrollview_refresher.dart';
import '../controllers/order_history_controller.dart';

part 'order_history_extension.dart';

class OrderHistoryScreen extends GetView<OrderHistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: Get.back,
          child: const Icon(
            Icons.arrow_back_ios,
            size: 16,
          ),
        ),
        title: Text(
          'Lịch sử đơn hàng'.tr,
          style: AppTextStyle.heavy(color: Colors.white),
        ),
        elevation: 1,
        backgroundColor: AppColor.primaryColor,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Obx(() => WidgetScrollviewRefresher(
                refreshController: controller.allRefreshController,
                onRefresh: controller.onRefresh,
                onLoading: controller.onLoading,
                isLoadMore: controller.isMore.value,
                child: ListView.separated(
                  controller: controller.scrollController,
                  itemCount: controller.listData.length,
                  itemBuilder: (context, index) {
                    return _buildItems(item: controller.listData[index]);
                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    thickness: 1,
                    color: AppColor.dividerColor,
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
