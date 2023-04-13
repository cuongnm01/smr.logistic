import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../resource/assets_constant/images_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryBackgroundColorLight,
      body: Center(
        child: FCoreImage(
          ImageConstants.appLogo,
          width: Get.width * 0.6,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
