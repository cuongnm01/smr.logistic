// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationDetailResponse _$NotificationDetailResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationDetailResponse(
      detail: json['data'] == null
          ? null
          : NotificationDetailModel.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..isSuccess = json['isSuccess'] as bool?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$NotificationDetailResponseToJson(
        NotificationDetailResponse instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'message': instance.message,
      'base': instance.base,
      'data': instance.detail,
    };
