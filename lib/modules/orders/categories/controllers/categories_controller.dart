import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/category/category.dart';
import 'package:ui_api/repository/app_ui_repository.dart';

import '../../../../base/base_controller.dart';
import '../../../../shared/constants/common.dart';
import '../../../../shared/utils/dialog_util.dart';
import '../../../../shared/widget/dialog/normal_widget.dart';

class CategoriesController extends BaseController {
  final _uiRepository = Get.find<AppUIRepository>();
  RxList<Category> categories = RxList.empty();

  String initialValue = '';
  String searchText = '';
  final filterData = RxList<Category>();

  CategoriesController() {
    if (Get.arguments != null) {
      initialValue = Get.arguments;
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
      filterData.value = categories;
    } else {
      filterData.value =
          categories.where((element) => element.isCompare(searchText)).toList();
    }
  }

  Future<void> onChange(Category item) async {
    initialValue = item.id ?? '';
    filterData.refresh();
    Get.back(result: item);
  }

  Future<void> loadData() async {
    await EasyLoading.show();
    await _uiRepository.getCategories().then((response) async {
      await EasyLoading.dismiss();
      if (response.isSuccess == CommonConstants.statusOk &&
          response.data != null &&
          response.data!.data != null) {
        categories.value = response.data!.data!;
        categories.refresh();
        onSearch(searchText);
      } else {
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: response.message ?? 'notify.error'.tr,
          onPressed: Get.back,
        );
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }
}
