import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../../resource/assets_constant/images_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widgets/carousel/slider_widget.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/home_controller.dart';

part 'home_components.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  final HomeController controller;

  HomeScreen(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Obx(
          () => Container(
            child: Column(
              children: [
                buildHeaderBar(),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          buildSlider(),
                          const SizedBox(height: 10),
                          buildCategory(),
                          const SizedBox(height: 20),
                          buildProduct(),
                        ],
                      ),
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
