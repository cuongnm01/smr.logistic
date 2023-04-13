import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../base/base_controller.dart';
import '../../styles/text_style/text_style.dart';

class ImageWidgetController extends BaseController {
  Future<ImageSource?> showImageSource(BuildContext context) async {
    if (Platform.isIOS) {
      return showCupertinoModalPopup<ImageSource>(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () => Navigator.of(context).pop(ImageSource.camera),
              child: Text(
                'Camera',
                style: AppTextStyle.regular(),
              ),
            ),
            CupertinoActionSheetAction(
              onPressed: () => Navigator.of(context).pop(ImageSource.gallery),
              child: Text(
                'Gallery',
                style: AppTextStyle.regular(),
              ),
            )
          ],
        ),
      );
    } else {
      return showModalBottomSheet(
        context: context,
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Padding(
                padding: EdgeInsets.only(top: 5, left: 20),
                child: Icon(Icons.camera_alt),
              ),
              title: Text(
                'Camera',
                style: AppTextStyle.regular(),
              ),
              onTap: () => Navigator.of(context).pop(ImageSource.camera),
            ),
            ListTile(
              leading: const Padding(
                padding: EdgeInsets.only(top: 5, left: 20),
                child: Icon(Icons.image),
              ),
              title: Text(
                'Gallery',
                style: AppTextStyle.regular(),
              ),
              onTap: () => Navigator.of(context).pop(ImageSource.gallery),
            )
          ],
        ),
      );
    }
  }
}
