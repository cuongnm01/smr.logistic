import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/constants/colors.dart';
import '../../../../shared/styles/text_style/text_style.dart';
import '../../../../shared/widget/form/widget_form_text_field.dart';
import '../controllers/profile_update_controller.dart';

part 'profile_update_extension.dart';

class ProfileUpdateScreen extends GetView<ProfileUpdateController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          'Cập nhật thông tin cá nhân'.tr,
          style: AppTextStyle.heavy(color: Colors.white),
        ),
        elevation: 1,
        backgroundColor: AppColor.primaryColor,
      ),
      body: SafeArea(
        child: Obx(
          () => Container(
            color: const Color(0xFFF5F5F5),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 24),
                Container(
                  child: Form(
                    key: controller.form,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              buildInfomation(),
                              Center(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 16),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: buildBottomBtn(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
