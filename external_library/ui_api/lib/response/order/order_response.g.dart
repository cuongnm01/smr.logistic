// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) =>
    OrderResponse(
      json['data'] == null
          ? null
          : Order.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..isSuccess = json['isSuccess'] as bool?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$OrderResponseToJson(OrderResponse instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'message': instance.message,
      'base': instance.base,
      'data': instance.data,
    };
