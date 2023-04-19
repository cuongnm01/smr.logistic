import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/constants/colors.dart';
import '../../../../shared/styles/text_style/text_style.dart';
import '../../../../shared/widget/form/widget_form_label_box.dart';
import '../../../../shared/widget/form/widget_form_text_field.dart';
import '../controllers/order_product_controller.dart';

part 'order_product_extension.dart';

class OrderProductScreen extends GetView<OrderProductController> {
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
          'Thông tin hàng hoá'.tr,
          style: AppTextStyle.heavy(color: Colors.white, fontSize: 20),
        ),
        elevation: 1,
        backgroundColor: AppColor.primaryColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => Container(
                  child: Form(
                    key: controller.form,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: buildRequired(),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildButton(
                    title: 'Huỷ',
                    color: Colors.grey.shade300,
                    onPress: Get.back,
                  ),
                  buildButton(
                    title: 'Ok',
                    onPress: controller.onSubmited,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
