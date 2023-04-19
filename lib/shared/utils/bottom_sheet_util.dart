import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../styles/text_style/text_style.dart';

class BottomSheetUtil {
  BottomSheetUtil._();

  static Future showBottomSheet({
    required Widget child,
    Function(dynamic value)? onVaLue,
  }) async {
    await showModalBottomSheet(
      context: Get.context!,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: AppColor.primaryBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(16),
          topStart: Radius.circular(16),
        ),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.only(top: 8, bottom: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 38,
              height: 3,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: AppColor.primaryBorderColor,
              ),
            ),
            child,
          ],
        ),
      ),
    ).then((value) {
      if (onVaLue != null) {
        onVaLue(value);
      }
    });
  }

  static Future createBottomSheet({
    String title = '',
    required Widget child,
    Function(dynamic value)? onVaLue,
  }) async {
    await showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      backgroundColor: AppColor.primaryBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(16),
          topStart: Radius.circular(16),
        ),
      ),
      builder: (context) => SafeArea(
        top: false,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 38.0,
                height: 3.0,
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: AppColor.neutral8,
                ),
              ),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 12),
                child: Text(
                  title,
                  style: AppTextStyle.heavy(),
                  textAlign: TextAlign.center,
                ),
              ),
              Flexible(child: child),
            ],
          ),
        ),
      ),
    ).then((value) {
      if (onVaLue != null) {
        onVaLue(value);
      }
    });
  }
}
