import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../styles/text_style/text_style.dart';
import 'widget_input_label.dart';

String patttern = r'^\[1]+(\d{7,10})$|^[0]+(\d{9,10})$';

class WidgetBuildFormTextField extends StatelessWidget {
  final String title;
  final String name;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final bool isRequired;
  final bool disable;
  final int? maxLines;
  final Function()? onPress;

  const WidgetBuildFormTextField({
    Key? key,
    required this.title,
    required this.name,
    required this.controller,
    required this.textInputType,
    this.maxLines,
    this.isRequired = false,
    this.disable = false,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 24, bottom: 8),
          child: WidgetInputLabel(
            label: title,
            isRequired: isRequired,
          ),
        ),
        FormBuilderTextField(
          name: name,
          controller: controller,
          keyboardType: textInputType,
          readOnly: disable,
          maxLines: maxLines,
          style: AppTextStyle.regular(
              color:
                  disable ? const Color(0xFF9098A1) : const Color(0xFF000000)),
          decoration: const InputDecoration(
            errorStyle: TextStyle(height: 0),
            contentPadding: EdgeInsets.all(10),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Colors.grey),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Colors.grey),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  width: 1,
                )),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1, color: Colors.red)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1, color: Colors.red)),
          ),
          inputFormatters: [
            LengthLimitingTextInputFormatter(255),
          ],
          onTap: onPress,
          validator: FormBuilderValidators.compose(validators()),
        ),
      ],
    );
  }

  List<FormFieldValidator<String>> validators() {
    final validators = <FormFieldValidator<String>>[];
    if (isRequired) {
      validators.add(
          FormBuilderValidators.required(errorText: 'Dữ liệu bắt buộc'.tr));
    }
    if (textInputType == TextInputType.number) {
      validators.add(FormBuilderValidators.min(0,
          errorText: 'Dữ liệu phải là dạng số'.tr));
    } else if (textInputType == TextInputType.emailAddress) {
      validators
          .add(FormBuilderValidators.email(errorText: 'Email không hợp lệ'.tr));
    } else if (textInputType == TextInputType.phone) {
      const regexHotline = r'^[1]+(\d{7,8})$|^[0]+(\d{9,10})$';
      const regexPhone = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
      validators.add(FormBuilderValidators.match(regexHotline,
          errorText: 'Số điện thoại không hợp lệ'.tr));
      validators.add(FormBuilderValidators.match(regexPhone,
          errorText: 'Số điện thoại không hợp lệ'.tr));
    }
    return validators;
  }
}
