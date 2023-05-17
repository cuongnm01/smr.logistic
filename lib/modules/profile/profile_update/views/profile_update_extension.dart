part of 'profile_update_screen.dart';

extension ProfileUpdateExtension on ProfileUpdateScreen {
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

  Widget buildInfomation() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetBuildFormTextField(
            title: 'Số điện thoại'.tr,
            name: 'phone',
            controller: controller.phoneController,
            textInputType: TextInputType.number,
            isRequired: true,
            disable: true,
          ),
          const SizedBox(height: 8),
          WidgetBuildFormTextField(
            title: 'Họ và tên'.tr,
            name: 'name',
            controller: controller.nameController,
            textInputType: TextInputType.name,
            isRequired: true,
          ),
          const SizedBox(height: 8),
          WidgetBuildFormTextField(
            title: 'Email'.tr,
            name: 'email',
            controller: controller.emailController,
            textInputType: TextInputType.emailAddress,
            isRequired: true,
          ),
          const SizedBox(height: 8),
          WidgetBuildFormTextField(
            title: 'Địa chỉ'.tr,
            name: 'address',
            controller: controller.addressController,
            textInputType: TextInputType.text,
            isRequired: false,
          ),
          const SizedBox(height: 20),
        ],
      ),
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
