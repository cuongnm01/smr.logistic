// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDetailResponse _$NewsDetailResponseFromJson(Map<String, dynamic> json) =>
    NewsDetailResponse(
      detail: json['data'] == null
          ? null
          : NewsDetailModel.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..isSuccess = json['isSuccess'] as bool?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$NewsDetailResponseToJson(NewsDetailResponse instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'message': instance.message,
      'base': instance.base,
      'data': instance.detail,
    };
