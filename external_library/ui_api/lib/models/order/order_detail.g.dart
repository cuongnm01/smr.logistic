// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetail _$OrderDetailFromJson(Map<String, dynamic> json) => OrderDetail(
      orderId: json['orderId'] as String?,
      productId: json['productId'] as String?,
      productName: json['productName'] as String?,
      isInsurance: json['isInsurance'] as bool?,
      weight: (json['weight'] as num?)?.toDouble(),
      long: (json['long'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      description: json['description'] as String?,
      categoryId: json['categoryId'] as String?,
      id: json['id'] as String?,
      temporaryPrice: (json['temporaryPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OrderDetailToJson(OrderDetail instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'productId': instance.productId,
      'productName': instance.productName,
      'isInsurance': instance.isInsurance,
      'weight': instance.weight,
      'long': instance.long,
      'width': instance.width,
      'height': instance.height,
      'price': instance.price,
      'currency': instance.currency,
      'description': instance.description,
      'categoryId': instance.categoryId,
      'id': instance.id,
      'temporaryPrice': instance.temporaryPrice,
    };
