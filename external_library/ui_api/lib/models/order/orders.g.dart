// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Orders _$OrdersFromJson(Map<String, dynamic> json) => Orders(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..totalPaging = json['totalPaging'] as int?
      ..totalRecord = json['totalRecord'] as int?;

Map<String, dynamic> _$OrdersToJson(Orders instance) => <String, dynamic>{
      'totalPaging': instance.totalPaging,
      'totalRecord': instance.totalRecord,
      'data': instance.data,
    };
