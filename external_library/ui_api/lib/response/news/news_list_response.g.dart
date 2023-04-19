// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsListResponse _$NewsListResponseFromJson(Map<String, dynamic> json) =>
    NewsListResponse(
      newsListModel: json['data'] == null
          ? null
          : NewsListModel.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..isSuccess = json['isSuccess'] as bool?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$NewsListResponseToJson(NewsListResponse instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'message': instance.message,
      'base': instance.base,
      'data': instance.newsListModel,
    };
