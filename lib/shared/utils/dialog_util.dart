import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../styles/text_style/text_style.dart';
import '../widgets/button/widget_button.dart';
import '../widgets/button/widget_text_button.dart';

enum DialogSize { FullWidth, HalfWidth, Popup }

extension DialogSizeExtension on DialogSize {
  double get width {
    switch (this) {
      case DialogSize.HalfWidth:
        return Get.width * 0.5;
      case DialogSize.Popup:
        return Get.width * 0.35;
      default:
        return Get.width * 0.9;
    }
  }
}

class DialogUtil {
  DialogUtil._();

  static Future showAppDialog({
    String title = '',
    DialogSize dialogSize = DialogSize.FullWidth,
    required Widget child,
    Function(dynamic value)? onVaLue,
  }) async {
    await showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Container(
            decoration: BoxDecoration(
              color: AppColor.primaryTextColorLight,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            padding: const EdgeInsets.only(left: 20, right: 10),
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: AppTextStyle.regular()
                      .copyWith(color: AppColor.secondTextColorLight),
                  textAlign: TextAlign.center,
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.close,
                    size: 25,
                    color: AppColor.primaryBackgroundColorLight,
                  ),
                ),
              ],
            ),
          ),
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          content: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
            child: Container(width: dialogSize.width, child: child),
          ),
        );
      },
    ).then((value) {
      if (onVaLue != null) {
        onVaLue(value);
      }
    });
  }

  static Future showPopup({
    String title = '',
    double? height,
    DialogSize dialogSize = DialogSize.FullWidth,
    bool barrierDismissible = false,
    required Widget child,
    int? action = 0,
    Color? backgroundColor,
    Function()? onPress,
    Function(dynamic value)? onVaLue,
  }) async {
    await showDialog(
      context: Get.overlayContext!,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          content: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
            child: Container(
              width: dialogSize.width,
              height: height,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  child,
                  (action == 1)
                      ? Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColor.primaryColorLight,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                  ),
                                ),
                                child: MaterialButton(
                                  child: Text(
                                    'Từ chối',
                                    style: AppTextStyle.regular()
                                        .copyWith(color: Colors.white),
                                  ),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 0.5,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColor.primaryColorLight,
                                  borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(12),
                                  ),
                                ),
                                child: MaterialButton(
                                  child: Text(
                                    'Đồng ý',
                                    style: AppTextStyle.regular()
                                        .copyWith(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    onPress;
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            )
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
          ),
          // actions: ,
          backgroundColor: backgroundColor ?? Colors.white,
        );
      },
    ).then((value) {
      if (onVaLue != null) {
        onVaLue(value);
      }
    });
  }

  static Future showMenu() async {
    return showDialog(
      context: Get.overlayContext!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          alignment: Alignment.center,
          //  insetPadding: const EdgeInsets.only(top: 160),
          child: Container(
            width: 50,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                'copied'.tr,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }

static Future createDialogMessage({
    required String message,
    BuildContext? context,
    String? title,
    VoidCallback? onPressed,
    String? textButton,
  }) async {
    await showCupertinoDialog(
      context: context ?? Get.context!,
      builder: (context) {
        return WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: CupertinoAlertDialog(
            title: (title?.isEmpty ?? true)
                ? null
                : Text(
                    title ?? '',
                    style: AppTextStyle.heavy(),
                    textAlign: TextAlign.center,
                  ),
            content: Text(
              message,
              style: AppTextStyle.regular(),
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (onPressed != null) {
                    onPressed();
                  }
                },
                style: TextButton.styleFrom(
                  minimumSize: const Size(100, 50),
                  padding: EdgeInsets.zero,
                  backgroundColor: AppColor.buttonBackgroundColor,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: Text(
                  textButton ?? 'ok'.tr,
                  style: AppTextStyle.heavy(color: AppColor.secondTextColor),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future createDialogConfirm({
    required String title,
    required String message,
    required String confirmTitle,
    required Function() onConfirm,
  }) async {
    await showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: () => Future.value(false),
            child: AlertDialog(
              insetPadding: const EdgeInsets.all(14),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              title: Text(
                title,
                style: AppTextStyle.heavy(),
                textAlign: TextAlign.center,
              ),
              contentPadding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              content: Container(
                width: Get.width * 0.9,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      message,
                      style:
                          AppTextStyle.regular(color: AppColor.fourthTextColor),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(
                          child: WidgetButton(
                            title: confirmTitle,
                            backgroundButtonColor: AppColor.stateError,
                            onPressed: () {
                              Navigator.pop(context);
                              onConfirm();
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: WidgetTextButton(
                            title: 'cancel'.tr,
                            onPressed: () => Navigator.pop(context),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
    // await Get.defaultDialog(
    //     title: title,
    //     titleStyle: AppTextStyle.heavy(),
    //     middleText: message,
    //     middleTextStyle: AppTextStyle.regular(),
    //     textConfirm: "Confirm",
    //     textCancel: "Cancel",
    //     textCustom: "Custom",
    //     titlePadding: const EdgeInsets.only(top: 24)
    //     // actions: <Widget>[
    //     //   TextButton(
    //     //     onPressed: () {
    //     //       Get.back();
    //     //     },
    //     //     style: TextButton.styleFrom(
    //     //       minimumSize: const Size(100, 50),
    //     //       padding: EdgeInsets.zero,
    //     //       backgroundColor: AppColor.buttonBackgroundColor,
    //     //       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    //     //       shape: RoundedRectangleBorder(
    //     //         borderRadius: BorderRadius.circular(0),
    //     //       ),
    //     //     ),
    //     //     child: Text(
    //     //       confirmTitle,
    //     //       style: AppTextStyle.heavy(
    //     //         color: AppColor.secondTextColor,
    //     //       ),
    //     //     ),
    //     //   ),
    //     //   TextButton(
    //     //     onPressed: () {
    //     //       Get.back();
    //     //     },
    //     //     child: Text(
    //     //       'cancel'.tr,
    //     //       style: AppTextStyle.heavy(
    //     //         color: AppColor.primaryTextColor,
    //     //       ),
    //     //     ),
    //     //   ),
    //     // ],
    //     );
  }

  static Future showDialogDatePicker(
    Widget content,
    Function(dynamic value) onValue,
  ) async {
    await showDialog(
        context: Get.overlayContext!,
        builder: (context) {
          return WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: AlertDialog(
              backgroundColor: AppColor.primaryBackgroundColor,
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.zero,
              titlePadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              content: content,
            ),
          );
        }).then((value) => onValue(value));
  }
}
