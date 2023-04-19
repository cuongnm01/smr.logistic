// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fee_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeeRequest _$FeeRequestFromJson(Map<String, dynamic> json) => FeeRequest(
      serviceType: json['serviceType'] as int?,
      shippingType: json['shippingType'] as int?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeeRequestToJson(FeeRequest instance) =>
    <String, dynamic>{
      'serviceType': instance.serviceType,
      'shippingType': instance.shippingType,
      'products': instance.products,
    };
