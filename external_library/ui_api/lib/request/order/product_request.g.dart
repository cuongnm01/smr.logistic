// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductRequest _$ProductRequestFromJson(Map<String, dynamic> json) =>
    ProductRequest(
      categoryId: json['categoryId'] as String?,
      categoryName: json['categoryName'] as String?,
      productId: json['productId'] as String?,
      productName: json['productName'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      long: (json['long'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      description: json['description'] as String?,
      isInsurance: json['isInsurance'] as bool?,
      index: json['index'] as int?,
    );

Map<String, dynamic> _$ProductRequestToJson(ProductRequest instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'productId': instance.productId,
      'productName': instance.productName,
      'price': instance.price,
      'currency': instance.currency,
      'weight': instance.weight,
      'long': instance.long,
      'width': instance.width,
      'height': instance.height,
      'description': instance.description,
      'isInsurance': instance.isInsurance,
      'index': instance.index,
    };
