import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';
import '../../utils/date_util.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget(
      {Key? key, this.title, this.currentDate, this.enableTime, this.clearData})
      : super(key: key);

  final String? title;
  final DateTime? currentDate;
  final bool? enableTime;
  final bool? clearData;

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? _date;

  String? currentTab;
  @override
  void initState() {
    super.initState();
    onchange(widget.currentDate);
    onchangeTime(widget.currentDate);
    currentTab = 'TAB';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.close),
              ),
              Text(
                widget.title ?? 'Tuỳ chọn'.tr,
                style: AppTextStyle.heavy(color: const Color(0xFF2C3A4B)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context, _date);
                },
                child: Text(
                  'Xong'.tr,
                  style: AppTextStyle.heavy(color: const Color(0xFF4076D4)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Divider(
            height: 1,
            color: Colors.grey.withOpacity(0.2),
            thickness: 1,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Thời gian'.tr,
                  style: AppTextStyle.heavy(
                      fontSize: 16, color: const Color(0xFF2C3A4B)),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '${_date != null ? DateUtil.formatDatetimeToString(_date?.toUtc(), type: DateUtil.DATE_TYPE) : '__/__/____'}',
                    style:
                        AppTextStyle.heavy(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Container(
                child: widget.clearData != null &&
                        widget.clearData! &&
                        _date != null
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pop(context, true);
                        },
                        child: const Icon(
                          Icons.delete_forever_outlined,
                        ))
                    : Container(),
              ),
            ],
          ),
          Expanded(
            child: Container(
              child: CalendarCarousel<Event>(
                onDayPressed: (DateTime date, List<Event> events) {
                  onchange(date);
                },
                headerTextStyle: AppTextStyle.regular(),
                weekdayTextStyle: const TextStyle(color: Colors.black),
                weekendTextStyle: const TextStyle(color: Colors.black),
                thisMonthDayBorderColor: Colors.grey,
                weekFormat: false,
                // height: 300,
                dayPadding: 5,
                todayBorderColor: Colors.white,
                todayButtonColor: Colors.white,
                todayTextStyle: AppTextStyle.regular(),
                selectedDateTime: _date,
                selectedDayButtonColor: AppColor.primaryColor,
                selectedDayBorderColor: AppColor.primaryColor,
                locale: 'vi',
                selectedDayTextStyle: AppTextStyle.regular(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void onchange(DateTime? value) {
    setState(() {
      _date = value;
    });
  }

  void onchangeTime(DateTime? value) {
    setState(() {
      _date = value;
    });
  }
}
