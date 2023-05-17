import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../base/base_controller.dart';
import '../../../../../shared/utils/dialog_util.dart';
import '../../../../shared/widget/dialog/normal_widget.dart';

class ContactController extends BaseController {
  ContactController();

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  Future<void> makeAction(String scheme, String endpoint) async {
    final launchUri = Uri(
      scheme: scheme,
      path: endpoint,
    );
    await launchUrl(launchUri);
  }

  Future<void> contactRouter(String endpoint) async {
    try {
      await launchUrlString(
        endpoint,
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      await DialogUtil.showPopup(
        dialogSize: DialogSize.Popup,
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        child: NormalWidget(
          title: 'error'.tr,
        ),
        onVaLue: (value) {},
      );
    }
  }

  Future<void> onPhoneAction(String phone) async {
    final phoneUri = Uri(scheme: 'tel', path: phone);
    await EasyLoading.show();
    await canLaunchUrl(phoneUri).then((value) async {
      await EasyLoading.dismiss();
      if (value) {
        await launchUrl(phoneUri);
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
    });
  }
}
