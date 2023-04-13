import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/resource/assets_constant/images_constants.dart';
import '../../../data/app_data_global.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/decoration/text_field_decoration.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget_hico/button/general_button.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/login_controller.dart';

part 'login_extension.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              color: Colors.amber,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Form(
                    key: controller.formLogin,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        FCoreImage(
                          ImageConstants.appLogo,
                          fit: BoxFit.fill,
                          height: 150,
                        ),
                        Text(
                          'Đăng nhập',
                          style: AppTextStyle.heavy(
                              fontSize: 25, color: Colors.grey),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              _buildUsername(),
                              const SizedBox(height: 20),
                              _buildPassword(),
                              const SizedBox(height: 20),
                              GeneralButton(
                                onPressed: () => controller.onLogin(),
                                borderRadius: BorderRadius.circular(8),
                                borderColor: const Color(0xFFC62828),
                                backgroundColor: const Color(0xFFC62828),
                                child: Text(
                                  'login'.tr,
                                  style: AppTextStyle.regular(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              const SizedBox(height: 28),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(
                                      'not_account'.tr,
                                      style: const TextStyle(
                                        color: Color(0xFF3B3B3B),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => controller.signin(),
                                    child: Text(
                                      'Đăng ký ngay'.tr,
                                      style: AppTextStyle.regular().copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
