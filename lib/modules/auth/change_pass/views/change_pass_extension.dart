part of 'change_pass_screen.dart';

extension ChangePassExtension on ChangePassScreen {
  Widget buildItem({
    required String label,
    required String title,
    double? borderWidth,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
                  width: borderWidth ?? 1, color: const Color(0xFFF5F5F5)))),
      child: Row(
        children: [
          Container(
              width: 150, child: Text(label, style: AppTextStyle.regular())),
          Expanded(child: Text(title, style: AppTextStyle.regular())),
        ],
      ),
    );
  }

  Widget _buildOldPassword() {
    return TextFormField(
      controller: controller.currentPassController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: controller.hideCurrentPassword.value,
      cursorColor: AppColor.fifthTextColorLight,
      style: AppTextStyle.regular(),
      decoration: TextFieldDecoration.borderLogin(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.dividerColorLight,
        hintText: 'Mật khẩu hiện tại',
        hintStype: AppTextStyle.regular(),
        suffixIcon: IconButton(
          onPressed: () {
            controller.hideCurrentPassword.value =
                !controller.hideCurrentPassword.value;
          },
          icon: Icon(
            controller.hideCurrentPassword.value
                ? Icons.visibility
                : Icons.visibility_off,
            color: AppColor.fifthTextColorLight,
          ),
        ),
      ).copyWith(
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
        ),
        disabledBorder:  OutlineInputBorder(
          borderRadius:const BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
        ),
        enabledBorder:  OutlineInputBorder(
          borderRadius:const BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
              width: 1,
            )),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.red)),
        focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.red)),
      ),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'data_requied'.tr : null,
    );
  }

  Widget _buildNewPassword() {
    return TextFormField(
      controller: controller.newPassController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: controller.hideNewPassword.value,
      cursorColor: AppColor.fifthTextColorLight,
      style: AppTextStyle.regular(),
      decoration: TextFieldDecoration.borderLogin(
        backgroundColor: AppColor.primaryBackgroundColorLight,
        borderColor: AppColor.dividerColorLight,
        hintText: 'Mật khẩu mới',
        hintStype: AppTextStyle.regular(),
        suffixIcon: IconButton(
          onPressed: () {
            controller.hideNewPassword.value =
                !controller.hideNewPassword.value;
          },
          icon: Icon(
            controller.hideNewPassword.value
                ? Icons.visibility
                : Icons.visibility_off,
            color: AppColor.fifthTextColorLight,
          ),
        ),
      ).copyWith(
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
        ),
        disabledBorder:  OutlineInputBorder(
          borderRadius:const BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
        ),
        enabledBorder:  OutlineInputBorder(
          borderRadius:const BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
              width: 1,
            )),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.red)),
        focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.red)),
      ),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'data_requied'.tr : null,
    );
  }

  Widget buildBottomBtn() {
    return Container(
        child: GestureDetector(
      onTap: controller.onSubmit,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
        decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          'Lưu',
          style: AppTextStyle.heavy(color: Colors.white),
        ),
      ),
    ));
  }
}
