import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/interceptors/listen_error_graphql_interceptor.dart';
import '../resource/assets_constant/icon_constants.dart';
import '../shared/network/constants/constants.dart';
import '../shared/network/controllers/network_controller.dart';
import '../shared/network/managers/network_manager.dart';
import '../shared/utils/dialog_util.dart';
import '../shared/widget/dialog/normal_widget.dart';

class BaseController extends FullLifeCycleController
    with FullLifeCycleMixin, NetworkManager, ListenErrorGraphQL {
  final _networkController = Get.find<NetworkController>();
  BuildContext? dialogErrorNetworkContext;
  var _hasNetwork = true;

  @override
  Future<void> onInit() async {
    super.onInit();

    // check network
    await checkConnectNetwork();
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  Future<void> onResumed() async {
    // check network
    await checkConnectNetwork();
  }

  Future<void> checkConnectNetwork() async {
    await _updateConnectNetwork(_networkController.connectionStatus.value);
    _networkController.connectionStatus.listen(_updateConnectNetwork);
  }

  Future _updateConnectNetwork(int status) async {
   if (status == NO_NETWORK) {
      if (_hasNetwork) {
        _hasNetwork = false;
        await _callDialogErrorNetwork();
      }
    } else {
      _hasNetwork = true;
      if (dialogErrorNetworkContext != null) {
        Navigator.of(dialogErrorNetworkContext!, rootNavigator: true).pop();
        dialogErrorNetworkContext = null;
      }
    }
  }

  Future<void> _callDialogErrorNetwork() async {
    if (dialogErrorNetworkContext == null) {
      dialogErrorNetworkContext = Get.context!;

      await DialogUtil.showPopup(
        dialogSize: DialogSize.Popup,
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        child: NormalWidget(
          icon: IconConstants.icFail,
          title: 'Vui lòng kiểm tra kết nối mạng'.tr,
        ),
        onVaLue: (value) async {
          dialogErrorNetworkContext = null;
          final status = await _networkController.checkConnectivity();
          await _updateConnectNetwork(status);
        },
      );
    }
  }
}
