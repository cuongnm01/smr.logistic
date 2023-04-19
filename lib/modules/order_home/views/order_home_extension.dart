part of 'order_home_screen.dart';

extension OrderHomeExtension on OrderHomeScreen {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thông tin cá nhân',
            style: AppTextStyle.heavy(),
          ),
          const SizedBox(height: 10),
          WidgetBuildFormTextField(
            title: 'Họ và tên'.tr,
            name: 'name',
            controller: controller.senderNameController,
            textInputType: TextInputType.name,
            isRequired: true,
          ),
          const SizedBox(height: 8),
          WidgetBuildFormTextField(
            title: 'Số điện thoại'.tr,
            name: 'phone',
            controller: controller.senderPhoneController,
            textInputType: TextInputType.number,
            isRequired: true,
          ),
          const SizedBox(height: 8),
          WidgetBuildFormTextField(
            title: 'Email'.tr,
            name: 'email',
            controller: controller.senderEmailController,
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 8),
          WidgetBuildFormTextField(
            title: 'Địa chỉ'.tr,
            name: 'address',
            controller: controller.senderAddressController,
            textInputType: TextInputType.text,
            isRequired: true,
          ),
          const SizedBox(height: 8),
          WidgetBuildFormTextField(
            title: 'Mô tả yêu cầu'.tr,
            name: 'note',
            controller: controller.descriptionController,
            textInputType: TextInputType.text,
          ),
        ],
      ),
    );
  }

  Widget buildRequired() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thông tin yêu cầu',
            style: AppTextStyle.heavy(),
          ),
          const SizedBox(height: 8),
          WidgetFormLabelBox(
            label: 'Chọn Loại yêu cầu'.tr,
            text: 'Vận chuyển',
            onPress: () {},
            showIcon: true,
            disable: true,
            isRequired: true,
          ),
          const SizedBox(height: 8),
          WidgetFormLabelBox(
            label: 'Chọn chiều vận chuyển'.tr,
            text: controller.serviceTypeText.value,
            onPress: controller.showServiceTypeOptionModalBottomSheet,
            showIcon: true,
            isRequired: true,
          ),
          const SizedBox(height: 8),
          WidgetFormLabelBox(
            label: 'Loại hình vận chuyển'.tr,
            text: controller.shippingTypeText.value,
            onPress: controller.showShippingTypeOptionModalBottomSheet,
            showIcon: true,
            isRequired: true,
          ),
          const SizedBox(height: 8),
          Obx(
            () => Container(
              child: GestureDetector(
                onTap: controller.onChangeBox,
                child: Row(
                  children: [
                    Icon(
                      controller.isReceiver.value
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      color: AppColor.primaryColor,
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Người nhận là người yêu cầu',
                      style: AppTextStyle.regular(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Obx(
            () => Visibility(
              visible: !controller.isReceiver.value,
              child: Column(
                children: [
                  WidgetBuildFormTextField(
                    title: 'Họ và tên người nhận'.tr,
                    name: 'name',
                    controller: controller.receiverNameController,
                    textInputType: TextInputType.name,
                    isRequired: true,
                  ),
                  const SizedBox(height: 8),
                  WidgetBuildFormTextField(
                    title: 'Số điện thoại người nhận'.tr,
                    name: 'phone',
                    controller: controller.receiverPhoneController,
                    textInputType: TextInputType.number,
                    isRequired: true,
                  ),
                  const SizedBox(height: 8),
                  WidgetBuildFormTextField(
                    title: 'Email người nhận'.tr,
                    name: 'email',
                    controller: controller.receiverEmailController,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
          WidgetBuildFormTextField(
            title: 'Địa chỉ người nhận'.tr,
            name: 'address',
            controller: controller.receiverAddressController,
            textInputType: TextInputType.text,
            isRequired: true,
          ),
          const SizedBox(height: 8),
          WidgetBuildFormTextField(
            title: 'Mã bưu điện'.tr,
            name: 'portalcode',
            controller: controller.receiverPostCodeController,
            textInputType: TextInputType.text,
          ),
        ],
      ),
    );
  }

  Widget buildProducts() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Thông tin hàng hoá',
                style: AppTextStyle.heavy(),
              ),
              GestureDetector(
                onTap: controller.onViewOrderProduct,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(6)),
                  child: const Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...List.generate(controller.products.length, (index) {
            return _buildProductItem(
              item: controller.products[index],
              index: index,
            );
          }),
          const SizedBox(height: 8),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tiền vận chuyển dự kiến:',
                  style: AppTextStyle.regular(),
                ),
                Text(
                  '${controller.total.value != 0 ? NumberFormat.currency(locale: 'vi', symbol: 'đ').format(controller.total.value) : 'Liên hệ'}',
                  style: AppTextStyle.heavy(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: controller.getFee,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                  color: controller.products.isNotEmpty
                      ? AppColor.primaryColor
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(6)),
              child: Text(
                'Check giá',
                style: AppTextStyle.regular(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem({required ProductRequest item, required int index}) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey.shade300),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.productName ?? '',
                style: AppTextStyle.heavy(fontSize: 16),
              ),
              if (item.isInsurance != null && item.isInsurance!)
                Text(
                  item.isInsurance != null && item.isInsurance!
                      ? '(Có bảo hiểm)'
                      : '',
                  style: AppTextStyle.regular(),
                ),
              Text(
                '${item.price ?? 0} VND',
                style: AppTextStyle.regular(),
              ),
              Row(
                children: [
                  Text(
                    '${item.weight ?? 0}kg, ',
                    style: AppTextStyle.regular(),
                  ),
                  Text(
                    '${item.long ?? 0}cmx${item.width ?? 0}cmx${item.height ?? 0}cm',
                    style: AppTextStyle.regular(),
                  ),
                ],
              ),
              Text(
                item.description ?? 'F',
                style: AppTextStyle.regular(),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              controller.removeProduct(index);
            },
            child: Icon(
              Icons.delete_forever_outlined,
              color: AppColor.primaryColor,
              size: 22,
            ),
          )
        ],
      ),
    );
  }

  Widget buildBottomBtn() {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: controller.onConfirm,
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    controller.isConfirm.value
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                    color: AppColor.primaryColor,
                    size: 20,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'Tôi đã đọc và đồng ý với thông tin về chính sách và bảng giá vận chuyển',
                      style: AppTextStyle.regular(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              if (controller.isConfirm.value) {
                controller.onSubmited();
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              decoration: BoxDecoration(
                  color: controller.isConfirm.value
                      ? AppColor.primaryColor
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                'Đặt hàng',
                style: AppTextStyle.heavy(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
