import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/category/category.dart';
import 'package:ui_api/models/product/product.dart';
import 'package:ui_api/models/user/user_info_model.dart';
import 'package:ui_api/request/order/product_request.dart';

import '../../../../base/base_controller.dart';
import '../../../../data/app_data_global.dart';
import '../../../../routes/app_pages.dart';
import '../../../../shared/utils/dialog_util.dart';
import '../../../../shared/widget/dialog/normal_widget.dart';

class OrderProductController extends BaseController {
  final userInfo = Rxn<UserInfoModel>();
  final form = GlobalKey<FormState>();

  RxBool isConfirm = false.obs;
  Rx<Category> category = Rx(Category());
  Rx<Product> product = Rx(Product());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController longController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  OrderProductController();

  @override
  Future<void> onInit() async {
    await super.onInit();
    userInfo.value = AppDataGlobal.userInfo;
  }

  Future<void> onConfirm() async {
    isConfirm.value = !isConfirm.value;
    isConfirm.refresh();
  }

  Future<void> getCategories() async {
    await Get.toNamed(Routes.CATEGORIES, arguments: category.value.id)
        ?.then((value) => {
              if (value != null && value is Category) {category.value = value}
            });
  }

  Future<void> getProducts() async {
    await Get.toNamed(Routes.PRODUCTS, arguments: {
      'categoryId': category.value.id,
      'initialValue': product.value.id,
    })?.then((value) => {
          if (value != null && value is Product) {product.value = value}
        });
  }

  Future<void> onSubmited() async {
    if (form.currentState?.validate() ?? false) {
      if (category.value.id == null || category.value.id!.isEmpty) {
        await DialogUtil.showPopup(
          dialogSize: DialogSize.Popup,
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          child: const NormalWidget(
            title: 'Chưa chọn loại hàng hoá',
          ),
          onVaLue: (value) {
            return;
          },
        );
      } else if (product.value.id == null || product.value.id!.isEmpty) {
        await DialogUtil.showPopup(
          dialogSize: DialogSize.Popup,
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          child: const NormalWidget(
            title: 'Chưa chọn hàng hoá',
          ),
          onVaLue: (value) {
            return;
          },
        );
      } else {
        Get.back(
          result: ProductRequest(
            productId: product.value.id,
            productName: product.value.name,
            price: priceController.text != ''
                ? double.parse(priceController.text)
                : 0,
            currency: '',
            weight: weightController.text != ''
                ? double.parse(weightController.text)
                : 0,
            long: longController.text != ''
                ? double.parse(longController.text)
                : 0,
            width: widthController.text != ''
                ? double.parse(widthController.text)
                : 0,
            height: heightController.text != ''
                ? double.parse(heightController.text)
                : 0,
            description: descriptionController.text,
          ),
        );
      }
    }
  }
}
