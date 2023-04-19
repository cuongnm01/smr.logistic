// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..totalPaging = json['totalPaging'] as int?
      ..totalRecord = json['totalRecord'] as int?;

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'totalPaging': instance.totalPaging,
      'totalRecord': instance.totalRecord,
      'data': instance.data,
    };
