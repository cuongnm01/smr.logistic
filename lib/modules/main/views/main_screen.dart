import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/constants/colors.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../controllers/main_controller.dart';

class MainScreen extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
            index: controller.index.value, children: controller.tabs),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(18), topLeft: Radius.circular(18)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18.0),
              topRight: Radius.circular(18.0),
            ),
            child: BottomNavigationBar(
                currentIndex: controller.index.value,
                onTap: (int _index) => controller.changeIndex(_index),
                selectedItemColor: AppColor.primaryTextColorLight,
                unselectedItemColor: AppColor.menuTextColorLight,
                selectedLabelStyle: AppTextStyle.regular(),
                unselectedLabelStyle: AppTextStyle.regular(),
                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Icon(Icons.home),
                    ),
                    activeIcon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Icon(
                        Icons.home,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    label: 'home.home'.tr,
                  ),
                  BottomNavigationBarItem(
                    icon: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Icon(Icons.manage_search),
                    ),
                    activeIcon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Icon(
                        Icons.manage_search,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    label: 'Đơn giá'.tr,
                  ),
                  BottomNavigationBarItem(
                    icon: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Icon(Icons.add_shopping_cart),
                    ),
                    activeIcon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Icon(
                        Icons.add_shopping_cart,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    label: 'Đặt hàng'.tr,
                  ),
                  BottomNavigationBarItem(
                    icon: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Icon(Icons.share_outlined),
                    ),
                    activeIcon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Icon(
                        Icons.share_outlined,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    label: 'Liên hệ'.tr,
                  ),
                  BottomNavigationBarItem(
                    icon: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Icon(Icons.manage_accounts),
                    ),
                    activeIcon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Icon(
                        Icons.manage_accounts,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    label: 'Tài khoản'.tr,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
