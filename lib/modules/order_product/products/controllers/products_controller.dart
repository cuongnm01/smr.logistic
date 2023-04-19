import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/product/product.dart';
import 'package:ui_api/repository/app_ui_repository.dart';

import '../../../../base/base_controller.dart';
import '../../../../shared/constants/common.dart';
import '../../../../shared/utils/dialog_util.dart';

class ProductsController extends BaseController {
  final _uiRepository = Get.find<AppUIRepository>();
  RxList<Product> products = RxList.empty();

  String initialValue = '';
  String categoryId = '';

  String searchText = '';
  final filterData = RxList<Product>();

  ProductsController() {
    if (Get.arguments != null) {
      final arguments = Get.arguments as Map;
      initialValue = arguments['initialValue'] ?? '';
      if (arguments['categoryId'] != null) {
        categoryId = arguments['categoryId'];
      }
    }
    loadData();
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  void onSearch(String searchText) {
    this.searchText = searchText;
    if (searchText.isEmpty) {
      filterData.value = products;
    } else {
      filterData.value = filterData.value =
          products.where((element) => element.isCompare(searchText)).toList();
    }
  }

  Future<void> onChange(Product item) async {
    initialValue = item.id ?? '';
    filterData.refresh();
    Get.back(result: item);
  }

  Future<void> loadData() async {
    await EasyLoading.show();
    await _uiRepository.getProducts(categoryId).then((response) async {
      await EasyLoading.dismiss();
      if (response.isSuccess == CommonConstants.statusOk &&
          response.data != null) {
        products.value = response.data!;
        products.refresh();
        onSearch(searchText);
      } else {
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: response.message ?? 'notify.error'.tr,
          onPressed: Get.back,
        );
      }
    }).catchError((onError) {
      DialogUtil.createDialogMessage(
        title: 'notify.title'.tr,
        message: 'notify.error'.tr,
        onPressed: Get.back,
      );
    });
  }
}
