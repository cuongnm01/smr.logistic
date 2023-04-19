// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      isInsurance: json['isInsurance'] as bool?,
      productCategoryId: json['productCategoryId'] as String?,
      productCategoryName: json['productCategoryName'] as String?,
      unitId: json['unitId'] as String?,
      unitName: json['unitName'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'isInsurance': instance.isInsurance,
      'productCategoryId': instance.productCategoryId,
      'unitId': instance.unitId,
      'productCategoryName': instance.productCategoryName,
      'unitName': instance.unitName,
    };
