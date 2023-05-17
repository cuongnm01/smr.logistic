import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ui_api/request/order/product_request.dart';

import '../../../../shared/constants/colors.dart';
import '../../../../shared/styles/text_style/text_style.dart';
import '../../../../shared/widget/form/widget_form_label_box.dart';
import '../../../../shared/widget/form/widget_form_text_field.dart';
import '../controllers/order_home_controller.dart';

part 'order_home_extension.dart';

class OrderHomeScreen extends GetView<OrderHomeController> {
  @override
  final OrderHomeController controller;
  OrderHomeScreen(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        centerTitle: true,
        leading: Container(),
        title: Text(
          'Tạo đơn hàng'.tr,
          style: AppTextStyle.heavy(color: Colors.white, fontSize: 20),
        ),
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Obx(
          () => Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: const Color(0xFFF5F5F5),
            child: Form(
              key: controller.form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: _buildExpansionTitle(
                      title: 'Thông tin cá nhân',
                      expansionChildren: buildInfomation(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: _buildExpansionTitle(
                      title: 'Thông tin yêu cầu',
                      expansionChildren: buildRequired(),
                    ),
                    
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: buildProducts(),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: buildBottomBtn(),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
