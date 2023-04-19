import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/models/master_data/service_type.dart';
import 'package:ui_api/models/master_data/shipping_type.dart';
import 'package:ui_api/models/user/user_info_model.dart';
import 'package:ui_api/repository/app_ui_repository.dart';
import 'package:ui_api/request/order/fee_request.dart';
import 'package:ui_api/request/order/order_request.dart';
import 'package:ui_api/request/order/product_request.dart';

import '../../../base/base_controller.dart';
import '../../../data/app_data_global.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/common.dart';
import '../../../shared/utils/bottom_sheet_util.dart';
import '../../../shared/utils/dialog_util.dart';
import '../../../shared/widget/dialog/normal_widget.dart';
import '../../../shared/widget/form/widget_radio_option.dart';

class OrderHomeController extends BaseController {
  final _uiRepository = Get.find<AppUIRepository>();
  final form = GlobalKey<FormState>();

  RxBool isReceiver = true.obs;
  RxBool isConfirm = false.obs;
  RxString serviceTypeText = ''.obs;
  RxString shippingTypeText = ''.obs;
  RxDouble total = 0.0.obs;

  OrderRequest request = OrderRequest();
  RxList<ProductRequest> products = RxList.empty();

  Rx<UserInfoModel> info = Rx(UserInfoModel());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController senderNameController = TextEditingController();
  final TextEditingController senderPhoneController = TextEditingController();
  final TextEditingController senderEmailController = TextEditingController();
  final TextEditingController senderAddressController = TextEditingController();
  final TextEditingController receiverNameController = TextEditingController();
  final TextEditingController receiverPhoneController = TextEditingController();
  final TextEditingController receiverEmailController = TextEditingController();
  final TextEditingController receiverAddressController =
      TextEditingController();
  final TextEditingController receiverPostCodeController =
      TextEditingController();
  final TextEditingController receiverDateController = TextEditingController();
  final TextEditingController receiverTimeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  OrderHomeController() {
    info.value = AppDataGlobal.userInfo!;
    senderNameController.text = info.value.fullName ?? '';
    senderPhoneController.text = info.value.phoneNumber ?? '';
    senderEmailController.text = info.value.email ?? '';
    senderAddressController.text = info.value.address ?? '';
    if (isReceiver.value) {
      receiverNameController.text = info.value.fullName ?? '';
      receiverPhoneController.text = info.value.phoneNumber ?? '';
      receiverEmailController.text = info.value.email ?? '';
      receiverAddressController.text = info.value.address ?? '';
    }
  }

  Future<void> loadData() async {
    // info.value = AppDataGlobal.userInfo!;
  }

  Future<void> onChangeBox() async {
    isReceiver.value = !isReceiver.value;
    isReceiver.refresh();

    receiverNameController.text =
        isReceiver.value ? info.value.fullName ?? '' : '';
    receiverPhoneController.text =
        isReceiver.value ? info.value.phoneNumber ?? '' : '';
    receiverEmailController.text =
        isReceiver.value ? info.value.email ?? '' : '';
    receiverAddressController.text =
        isReceiver.value ? info.value.address ?? '' : '';
  }

  Future<void> onConfirm() async {
    isConfirm.value = !isConfirm.value;
    isConfirm.refresh();
  }

  Future<void> showServiceTypeOptionModalBottomSheet() async {
    await BottomSheetUtil.showBottomSheet(
      child: WidgetRadioOption(
        title: 'Tuỳ chọn'.tr,
        option: [
          ...List.generate(AppDataGlobal.serviceType!.length, (index) {
            return MenuRadioModel(
              onPress: () {
                chooseServiceType(AppDataGlobal.serviceType![index]);
                Get.back();
              },
              title: AppDataGlobal.serviceType![index].name,
              id: '${AppDataGlobal.serviceType![index].type}',
            );
          })
        ],
      ),
    ).then(
      (value) {
        if (value != null && value) {
          Get.back(result: true);
        }
      },
    );
  }

  void chooseServiceType(ServiceType item) {
    serviceTypeText.value = item.name ?? '';
    serviceTypeText.refresh();
    request.serviceType = item.type;
    Get.back();
  }

  Future<void> showShippingTypeOptionModalBottomSheet() async {
    await BottomSheetUtil.showBottomSheet(
      child: WidgetRadioOption(
        title: 'Tuỳ chọn'.tr,
        option: [
          ...List.generate(AppDataGlobal.shippingType!.length, (index) {
            return MenuRadioModel(
              onPress: () {
                chooseShippingType(AppDataGlobal.shippingType![index]);
                Get.back();
              },
              title: AppDataGlobal.shippingType![index].name,
              id: '${AppDataGlobal.shippingType![index].type}',
            );
          })
        ],
      ),
    ).then(
      (value) {
        if (value != null && value) {
          Get.back(result: true);
        }
      },
    );
  }

  void chooseShippingType(ShippingType item) {
    shippingTypeText.value = item.name ?? '';
    shippingTypeText.refresh();
    request.shippingType = item.type;
    Get.back();
  }

  Future<void> onViewOrderProduct() async {
    await Get.toNamed(Routes.ORDER_PRODUCT)?.then((value) {
      if (value != null && value is ProductRequest) {
        products.add(value);
        getFee();
      }
    });
  }

  Future<void> getFee() async {
    await EasyLoading.show();
    await _uiRepository
        .getFee(FeeRequest(
            serviceType: request.serviceType,
            shippingType: request.shippingType,
            products: products))
        .then((response) async {
      await EasyLoading.dismiss();
      if (response.isSuccess == CommonConstants.statusOk &&
          response.data != null) {
        total.value = response.data!.totalTemporaryPrice ?? 0;
        products.refresh();
      } else {
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: response.message ?? 'notify.error'.tr,
        );
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
        title: 'notify.title'.tr,
        message: 'notify.error'.tr,
      );
    });
  }

  void removeProduct(int index) {
    products.removeAt(index);
    products.refresh();
    getFee();
  }

  void onSubmited() {
    if (form.currentState?.validate() ?? false) {
      if (request.serviceType == null) {
        DialogUtil.showPopup(
          dialogSize: DialogSize.Popup,
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          child: const NormalWidget(
            title: 'Chưa chọn chiều vận chuyển',
          ),
          onVaLue: (value) {
            return;
          },
        );
      } else if (request.shippingType == null) {
        DialogUtil.showPopup(
          dialogSize: DialogSize.Popup,
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          child: const NormalWidget(
            title: 'Chưa chọn loại hình vận chuyển',
          ),
          onVaLue: (value) {
            return;
          },
        );
      } else {
        request.senderName = senderNameController.text;
        request.senderPhone = senderPhoneController.text;
        request.senderEmail = senderEmailController.text;
        request.senderAddress = senderAddressController.text;
        request.description = descriptionController.text;
        request.isReceiver = isReceiver.value;
        request.receiverName = receiverNameController.text;
        request.receiverPhone = receiverPhoneController.text;
        request.receiverEmail = receiverEmailController.text;
        request.receiverAddress = receiverAddressController.text;
        request.receiverPostCode = receiverPostCodeController.text;
        request.orderType = 1;
        request.products = products;
        createOrder();
      }
    }
  }

  Future<void> createOrder() async {
    await EasyLoading.show();
    await _uiRepository.createOrder(request).then((response) async {
      await EasyLoading.dismiss();
      if (response.isSuccess == CommonConstants.statusOk) {
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: 'Đặt hàng thành công'.tr,
          onPressed: () {
            products.value = [];
            getFee();
          },
        );
      } else {
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: response.message ?? 'notify.error'.tr,
        );
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
        title: 'notify.title'.tr,
        message: 'notify.error'.tr,
      );
    });
  }
}
