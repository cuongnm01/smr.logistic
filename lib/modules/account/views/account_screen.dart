import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resource/assets_constant/images_constants.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/account_controller.dart';

part 'account_extension.dart';

class AccountScreen extends GetView<AccountController> {
  @override
  final AccountController controller;
  AccountScreen(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: const Color(0xFFF5F5F5),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 14),
                Obx(() => Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Xin chào,',
                              style: AppTextStyle.regular(color: Colors.grey),
                            ),
                            Text(
                              '${controller.userInfo.value?.fullName ?? ''}',
                              style: AppTextStyle.heavy(),
                            ),
                          ],
                        )),
                        FCoreImage(
                          ImageConstants.avatar,
                          width: 48,
                          height: 48,
                        ),
                      ],
                    )),
                const SizedBox(height: 50),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'THÔNG TIN',
                        style: AppTextStyle.regular(
                            fontSize: 16, color: const Color(0xFF89929F)),
                      ),
                      buildItem(
                        icon: Icon(
                          Icons.account_circle_outlined,
                          color: AppColor.primaryColor,
                          size: 25,
                        ),
                        title: 'profile'.tr,
                        onPress: () {
                          Get.toNamed(Routes.PROFILE);
                        },
                      ),
                      buildItem(
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                          color: AppColor.primaryColor,
                          size: 25,
                        ),
                        title: 'Đơn hàng'.tr,
                        onPress: () {
                          Get.toNamed(Routes.ORDER_HISTORY);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CÀI ĐẶT',
                        style: AppTextStyle.regular(
                            fontSize: 16, color: const Color(0xFF89929F)),
                      ),
                      buildItem(
                        icon: Icon(
                          Icons.lock_outline,
                          color: AppColor.primaryColor,
                          size: 25,
                        ),
                        title: 'change_password'.tr,
                        onPress: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildItem(
                        icon: Icon(
                          Icons.logout,
                          color: AppColor.primaryColor,
                          size: 25,
                        ),
                        title: 'logout'.tr,
                        titleColor: AppColor.primaryTextColorLight,
                        allowArrow: 0,
                        onPress: () {
                          controller.onLogout();
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
