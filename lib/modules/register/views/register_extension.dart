part of 'register_screen.dart';

extension _RegisterExtension on RegisterScreen {
  Widget _buildUsername() {
    return TextFormField(
      controller: controller.usernameController,
      autofocus: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      cursorColor: AppColor.fifthTextColorLight,
      style: AppTextStyle.regular(),
      decoration: TextFieldDecoration.borderLogin(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.dividerColorLight,
        hintText: ' Tài khoản',
        hintStype: AppTextStyle.regular(),
      ),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'data_requied'.tr : null,
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      controller: controller.passwordController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: controller.hideNewPassword.value,
      cursorColor: AppColor.fifthTextColorLight,
      style: AppTextStyle.regular(),
      decoration: TextFieldDecoration.borderLogin(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.dividerColorLight,
        hintText: ' ${'password'.tr}',
        hintStype: AppTextStyle.regular(),
        suffixIcon: IconButton(
          onPressed: () {
            controller.hideShowNewPassword();
          },
          icon: Icon(
            controller.hideNewPassword.value
                ? Icons.visibility
                : Icons.visibility_off,
            color: AppColor.fifthTextColorLight,
          ),
        ),
      ),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'data_requied'.tr : null,
    );
  }

  Widget _buildFullname() {
    return TextFormField(
      controller: controller.fullnameController,
      autofocus: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      cursorColor: AppColor.fifthTextColorLight,
      style: AppTextStyle.regular(),
      decoration: TextFieldDecoration.borderLogin(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.dividerColorLight,
        hintText: ' Họ tên',
        hintStype: AppTextStyle.regular(),
      ),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'data_requied'.tr : null,
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      controller: controller.phoneController,
      autofocus: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number,
      cursorColor: AppColor.fifthTextColorLight,
      style: AppTextStyle.regular(),
      decoration: TextFieldDecoration.borderLogin(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.dividerColorLight,
        hintText: ' Số điện thoại',
        hintStype: AppTextStyle.regular(),
      ),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'data_requied'.tr : null,
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      controller: controller.emailController,
      autofocus: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      cursorColor: AppColor.fifthTextColorLight,
      style: AppTextStyle.regular(),
      decoration: TextFieldDecoration.borderLogin(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.dividerColorLight,
        hintText: ' Email',
        hintStype: AppTextStyle.regular(),
      ),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'data_requied'.tr : null,
    );
  }

  Widget _buildAddress() {
    return TextFormField(
      controller: controller.addressController,
      autofocus: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      cursorColor: AppColor.fifthTextColorLight,
      style: AppTextStyle.regular(),
      decoration: TextFieldDecoration.borderLogin(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.dividerColorLight,
        hintText: ' Địa chỉ',
        hintStype: AppTextStyle.regular(),
      ),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'data_requied'.tr : null,
    );
  }

  Widget _buildDob() {
    return GestureDetector(
      onTap: controller.showDateOptionModalBottomSheet,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${controller.dobText.value}',
              style: AppTextStyle.regular(),
            ),
            const Icon(
              Icons.calendar_month_outlined,
              color: Colors.grey,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
