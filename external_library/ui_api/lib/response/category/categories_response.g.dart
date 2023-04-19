// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesResponse _$CategoriesResponseFromJson(Map<String, dynamic> json) =>
    CategoriesResponse(
      json['data'] == null
          ? null
          : Categories.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..isSuccess = json['isSuccess'] as bool?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$CategoriesResponseToJson(CategoriesResponse instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'message': instance.message,
      'base': instance.base,
      'data': instance.data,
    };
