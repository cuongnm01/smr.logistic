import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/contact_controller.dart';

class ContactScreen extends GetView<ContactController> {
  @override
  final ContactController controller;

  ContactScreen(this.controller);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leading: Container(),
        title: Text(
          'Liên hệ',
          style: AppTextStyle.heavy(color: Colors.white, fontSize: 20),
        ),
        elevation: 1,
        backgroundColor: AppColor.primaryColor,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                      bottom:
                          BorderSide(width: 1, color: Colors.grey.shade300))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: FCoreImage(
                      'lib/resource/assets_resources/icons/phone-call.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                  Text(
                    'Hotline hỗ trợ: ',
                    style: AppTextStyle.regular(color: const Color(0xFF333333)),
                  ),
                  InkWell(
                    onTap: () {
                      controller.onPhoneAction('0977983699');
                    },
                    child: Text(
                      '0977983699',
                      style: AppTextStyle.regular(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                      bottom:
                          BorderSide(width: 1, color: Colors.grey.shade300))),
              child: InkWell(
                onTap: () {
                  controller.contactRouter('https://zalo.me/0977983699');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: FCoreImage(
                        'lib/resource/assets_resources/icons/zalo.png',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    Text(
                      'Chat qua zalo ',
                      style:
                          AppTextStyle.regular(color: const Color(0xFF333333)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                      bottom:
                          BorderSide(width: 1, color: Colors.grey.shade300))),
              child: InkWell(
                onTap: () {
                  controller.contactRouter('https://www.facebook.com/');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: FCoreImage(
                        'lib/resource/assets_resources/icons/messenger.png',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    Text(
                      'Chat qua messenger',
                      style:
                          AppTextStyle.regular(color: const Color(0xFF333333)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
