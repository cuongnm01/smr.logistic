part of 'forgot_password_screen.dart';

extension _ForgotPasswordExtension on ForgotPasswordScreen {
  Widget _buildUsername() {
    return TextFormField(
      controller: controller.usernameController,
      textAlign: TextAlign.center,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      cursorColor: AppColor.fifthTextColorLight,
      style: AppTextStyle.regular(),
      decoration: TextFieldDecoration.borderLogin(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.dividerColorLight,
        hintText: 'forgot_password.inputtext'.tr,
        hintStype: AppTextStyle.regular(),
      ),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'data_requied'.tr : null,
    );
  }
}
