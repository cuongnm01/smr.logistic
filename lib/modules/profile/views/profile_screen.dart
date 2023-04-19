import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resource/assets_constant/images_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/profile_controller.dart';

part 'profile_extension.dart';

class ProfileScreen extends GetView<ProfileController> {
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
          'profile'.tr,
          style: AppTextStyle.heavy(color: Colors.white),
        ),
        elevation: 1,
        backgroundColor: AppColor.primaryColor,
      ),
      body: SafeArea(
        child: Expanded(
          child: Obx(
            () => Container(
              color: const Color(0xFFF5F5F5),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Stack(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            const SizedBox(height: 50),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 16),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 50),
                                  buildItem(
                                      label: 'Họ và tên',
                                      title:
                                          '${controller.userInfo.value?.fullName ?? ''}'),
                                  buildItem(
                                      label: 'Số điện thoại',
                                      title:
                                          '${controller.userInfo.value?.phoneNumber ?? ''}'),
                                  buildItem(
                                      label: 'Email',
                                      title:
                                          '${controller.userInfo.value?.email ?? ''}'),
                                  buildItem(
                                      label: 'Địa chỉ',
                                      title:
                                          '${controller.userInfo.value?.address ?? ''}',
                                      borderWidth: 0),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        child: Center(
                          child: FCoreImage(
                            ImageConstants.avatar,
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
