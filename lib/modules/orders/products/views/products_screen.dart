import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/product/product.dart';

import '../../../../shared/constants/colors.dart';
import '../../../../shared/styles/text_style/text_style.dart';
import '../controllers/products_controller.dart';

class ProductsScreen extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hàng hoá'.tr,
          style: AppTextStyle.regular(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: AppColor.primaryColor,
      ),
      body: SafeArea(
        top: false,
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [
        _buildSearchBar(),
        Expanded(
          child: Obx(
            () => ListView.separated(
              itemCount: controller.filterData.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) =>
                  _buildItemCellSingleChoose(controller.filterData[index]),
            ),
          ),
        ),
      ],
    );
  }

  Container _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        textInputAction: TextInputAction.search,
        onChanged: controller.onSearch,
        decoration: InputDecoration(
          hintText: 'Tìm kiếm'.tr,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
            size: 26,
          ),
        ),
      ),
    );
  }

  Widget _buildItemCellSingleChoose(Product item) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      horizontalTitleGap: 5,
      leading: controller.initialValue == item.id
          ? Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Icon(
                Icons.radio_button_checked,
                color: AppColor.primaryColor,
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Icon(
                Icons.radio_button_off,
                color: AppColor.primaryColor,
              ),
            ),
      title: Text(
        item.name ?? '',
        style: AppTextStyle.regular(),
      ),
      onTap: () {
        controller.onChange(item);
      },
    );
  }
}
