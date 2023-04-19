import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';
import '../button/general_button.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 14),
                Text(
                  'Đăng xuất',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.heavy(),
                ),
                const SizedBox(height: 8),
                Text(
                  'Bạn có chắc muốn đăng xuất ngay bây giờ?',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.regular(),
                ),
                const SizedBox(height: 14),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: GeneralButton(
                  borderColor: AppColor.primaryColor,
                  backgroundColor: AppColor.primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Từ chối',
                    style: AppTextStyle.regular(color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: 1,
                decoration: const BoxDecoration(color: Colors.white),
              ),
              Expanded(
                child: GeneralButton(
                  borderColor: AppColor.primaryColor,
                  backgroundColor: AppColor.primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(12),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(1);
                  },
                  child: Text(
                    'Đồng ý',
                    style: AppTextStyle.regular(color: Colors.white),
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
