part of 'order_product_screen.dart';

extension OrderProductExtension on OrderProductScreen {
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

  Widget buildRequired() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetFormLabelBox(
            label: 'Loại hàng hoá'.tr,
            text: '${controller.category.value.name ?? ''}',
            onPress: controller.getCategories,
            showIcon: true,
            isRequired: true,
          ),
          const SizedBox(height: 8),
          WidgetFormLabelBox(
            label: 'Tên hàng hoá'.tr,
            text: '${controller.product.value.name ?? ''}',
            onPress: controller.getProducts,
            showIcon: true,
            isRequired: true,
          ),
          const SizedBox(height: 12),
          Container(
              child: Row(
            children: [
              Icon(
                controller.product.value.isInsurance != null &&
                        controller.product.value.isInsurance!
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: AppColor.primaryColor,
                size: 20,
              ),
              const SizedBox(width: 4),
              Text(
                'Có bảo hiểm',
                style: AppTextStyle.regular(),
              ),
            ],
          )),
          const SizedBox(height: 8),
          WidgetBuildFormTextField(
            title: 'Giá trị hàng hoá'.tr,
            name: 'address',
            controller: controller.priceController,
            textInputType: TextInputType.number,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: WidgetBuildFormTextField(
                  title: 'Cân nặng (kg)'.tr,
                  name: 'portalcode',
                  controller: controller.weightController,
                  textInputType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: WidgetBuildFormTextField(
                  title: 'Dài (cm)'.tr,
                  name: 'portalcode',
                  controller: controller.longController,
                  textInputType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: WidgetBuildFormTextField(
                  title: 'Rộng (cm)'.tr,
                  name: 'portalcode',
                  controller: controller.widthController,
                  textInputType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: WidgetBuildFormTextField(
                  title: 'Cao (cm)'.tr,
                  name: 'portalcode',
                  controller: controller.heightController,
                  textInputType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          WidgetBuildFormTextField(
            title: 'Mô tả yêu cầu'.tr,
            name: 'address',
            controller: controller.descriptionController,
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget buildButton(
      {required String title, Function()? onPress, Color? color}) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
        decoration: BoxDecoration(
            color: color ?? AppColor.primaryColor,
            borderRadius: BorderRadius.circular(8)),
        child: Text(
          title,
          style: AppTextStyle.regular(color: Colors.white),
        ),
      ),
    );
  }
}
