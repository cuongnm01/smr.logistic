import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ui_api/models/order/order.dart';
import 'package:ui_api/models/order/order_detail.dart';

import '../../../../shared/constants/colors.dart';
import '../../../../shared/styles/text_style/text_style.dart';
import '../../../../shared/utils/date_util.dart';
import '../controllers/order_history_detail_controller.dart';

part 'order_history_detail_extension.dart';

class OrderHistoryDetailScreen extends GetView<OrderHistoryDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: Get.back,
          child: Container(
            color: Colors.transparent,
            child: const Icon(
              Icons.arrow_back_ios,
              size: 16,
            ),
          ),
        ),
        title: Text(
          'Chi tiết đơn hàng'.tr,
          style: AppTextStyle.heavy(color: Colors.white),
        ),
        elevation: 1,
        backgroundColor: AppColor.primaryColor,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildItems(item: controller.order.value),
                    _buildSenderInfo(),
                    _buildReciverInfo(),
                    _buildProductInfo(),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
