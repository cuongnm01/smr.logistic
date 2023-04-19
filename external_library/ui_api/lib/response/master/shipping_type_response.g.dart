// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_type_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingTypeResponse _$ShippingTypeResponseFromJson(
        Map<String, dynamic> json) =>
    ShippingTypeResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => ShippingType.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..isSuccess = json['isSuccess'] as bool?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$ShippingTypeResponseToJson(
        ShippingTypeResponse instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'message': instance.message,
      'base': instance.base,
      'data': instance.data,
    };
