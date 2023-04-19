import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/widget/form/widget_form_date_field.dart';
import '/resource/assets_constant/images_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/decoration/text_field_decoration.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widget/button/general_button.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/register_controller.dart';

part 'register_extension.dart';

class RegisterScreen extends GetView<RegisterController> {
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
          child: Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Obx(
                      () => Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Form(
                          key: controller.registerForm,
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              FCoreImage(
                                ImageConstants.appLogo,
                                fit: BoxFit.fill,
                                height: 150,
                              ),
                              Text(
                                'Đăng ký',
                                style: AppTextStyle.heavy(
                                    fontSize: 25, color: Colors.grey),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Obx(() => Column(
                                      children: [
                                        const SizedBox(height: 10),
                                        _buildUsername(),
                                        const SizedBox(height: 10),
                                        _buildPassword(),
                                        const SizedBox(height: 10),
                                        _buildFullname(),
                                        const SizedBox(height: 10),
                                        _buildPhoneNumber(),
                                        const SizedBox(height: 10),
                                        _buildEmail(),
                                        const SizedBox(height: 10),
                                        _buildAddress(),
                                        const SizedBox(height: 10),
                                        _buildDob(),
                                        const SizedBox(height: 20),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: CommonConstants
                                                  .paddingDefault),
                                          child: GeneralButton(
                                            onPressed: () =>
                                                controller.register(),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderColor: AppColor.primaryColor,
                                            backgroundColor:
                                                AppColor.primaryColor,
                                            child: Text(
                                              'register'.tr,
                                              style: AppTextStyle.regular(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 28),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Text(
                                                'Bạn đã có tài khoản?'.tr,
                                                style: const TextStyle(
                                                  color: Color(0xFF3B3B3B),
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: Get.back,
                                              child: Text(
                                                'Đăng nhập'.tr,
                                                style: AppTextStyle.regular()
                                                    .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    )),
                              ),
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
        ),
      ),
    );
  }
}
