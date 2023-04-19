import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';

class MenuRadioModel {
  GestureTapCallback? onPress;
  String? id;
  String? title;
  MenuRadioModel({
    this.id,
    this.onPress,
    this.title,
  });
}

// ignore: must_be_immutable
class WidgetRadioOption extends StatefulWidget {
  final String? title;
  final String? description;
  final List<MenuRadioModel> option;
  GestureTapCallback? onAction;
  List<String>? selected;
  final Function(List<MenuRadioModel> content)? onConfirm;

  String? currentId;

  WidgetRadioOption({
    Key? key,
    this.title,
    this.description,
    required this.option,
    this.currentId,
    this.onAction,
    this.selected,
    this.onConfirm,
  }) : super(key: key);

  @override
  State<WidgetRadioOption> createState() => _WidgetRadioOptionState();
}

class _WidgetRadioOptionState extends State<WidgetRadioOption> {
  @override
  Widget build(BuildContext context) {
    return _buildLeadActivities();
  }

  Widget _buildLeadActivities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 15, left: 24, right: 24),
              alignment: Alignment.center,
              child: Text(
                widget.title ?? '',
                style: AppTextStyle.heavy(fontSize: 18),
              ),
            ),
            Positioned(
              top: 10,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.close),
              ),
            ),
          ],
        ),
        const Divider(height: 1),
        Container(
          child: widget.description != null && widget.description!.isNotEmpty
              ? Container(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 15, left: 24, right: 24),
                  child: Text(
                    widget.description ?? '',
                    style: AppTextStyle.heavy(fontSize: 18),
                  ),
                )
              : Container(),
        ),
        const SizedBox(height: 15),
        ...List.generate(
          widget.option.length,
          (index) {
            return _buildFunctionCell(
              id: widget.option[index].id ?? '',
              title: widget.option[index].title ?? '',
              ontap: widget.option[index].onPress!,
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: widget.onAction != null
              ? GestureDetector(
                  onTap: widget.onAction,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    alignment: Alignment.center,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Text(
                      'send'.tr,
                      style: AppTextStyle.regular(
                          fontSize: 18, color: Colors.white),
                    ),
                  ),
                )
              : Container(),
        )
      ],
    );
  }

  Widget _buildFunctionCell({
    required String id,
    required String title,
    required GestureTapCallback ontap,
  }) {
    return GestureDetector(
      onTap: () {
        ontap.call();
        setState(() {
          final index = widget.selected?.indexWhere((element) => element == id);
          if ((index ?? -1) >= 0) {
            widget.selected?.removeAt(index!);
          } else {
            if (widget.selected != null) {
              widget.selected?.add(id);
            } else {
              widget.selected = [id];
            }
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              widget.selected != null &&
                      widget.selected!.any((element) => element == id)
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              size: 20,
              color: widget.selected != null &&
                      widget.selected!.any((element) => element == id)
                  ? Colors.green
                  : Colors.grey,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
    );
  }
}
