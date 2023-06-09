import 'dart:developer';

import 'package:intl/intl.dart';

import '../constants/common.dart';

class DateUtil {
  static const String DATETIME_TYPE = 'date_time';
  static const String DATE_TYPE = 'date';
  static const String DAY_TYPE = 'day';
  static const String TIME_TYPE = 'time';
  static const String API_TYPE = 'api';
  static const String DATE_API_TYPE = 'dateApi';

  static String formatDatetimeToString(
    DateTime? date, {
    bool toLocal = true,
    String? newPattern,
    String type = DATE_TYPE,
  }) {
    if (date == null) {
      return '';
    }
    if (newPattern == null) {
      switch (type) {
        case DATETIME_TYPE:
          newPattern = CommonConstants.dateTimeFormat;
          break;
        case TIME_TYPE:
          newPattern = CommonConstants.timeFormat;
          break;
        default:
          newPattern = CommonConstants.dateFormat;
          break;
      }
    }
    return DateFormat(newPattern).format(toLocalDate(date, toLocal));
  }

  static DateTime toLocalDate(DateTime date, bool toLocal) {
    return toLocal ? date.toLocal() : date;
  }

  static DateTime formatToDate(String inputString) {
    final formatter = DateFormat(CommonConstants.dateFormat);
    return formatter.parse(inputString).toLocal();
  }

  static DateTime formatToDateTime(String inputString) {
    final formatter = DateFormat(CommonConstants.dateTimeFormat);
    return formatter.parse(inputString).toLocal();
  }
}
