import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';
import '../../widgets/image_widget/fcore_image.dart';
import '../button/general_button.dart';

class TopupWidget extends StatelessWidget {
  const TopupWidget({
    Key? key,
    this.icon,
    this.title,
    this.titleBtn,
    this.titleWidget,
  }) : super(key: key);

  final String? icon;
  final String? title;
  final String? titleBtn;
  final Widget? titleWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 18),
                FCoreImage(
                  icon ?? IconConstants.icProfile,
                  width: 32,
                ),
                const SizedBox(height: 10),
                if (title != null && title != '')
                  Text(
                    title ?? '',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.regular(),
                  ),
                titleWidget ?? Container(),
                const SizedBox(height: 15),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: GeneralButton(
                  borderColor: AppColor.primaryColorLight,
                  backgroundColor: AppColor.primaryColorLight,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'topup.cancel'.tr,
                    style: AppTextStyle.regular(),
                  ),
                ),
              ),
              const SizedBox(
                width: 1,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
              Expanded(
                child: GeneralButton(
                  borderColor: AppColor.primaryColorLight,
                  backgroundColor: AppColor.primaryColorLight,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(12),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(1);
                  },
                  child: Text(
                    'topup.recharge'.tr,
                    style: AppTextStyle.regular(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
