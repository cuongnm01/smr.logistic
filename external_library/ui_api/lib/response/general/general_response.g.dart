// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GerenalResponse _$GerenalResponseFromJson(Map<String, dynamic> json) =>
    GerenalResponse(
      json['data'],
    )
      ..isSuccess = json['isSuccess'] as bool?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$GerenalResponseToJson(GerenalResponse instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'message': instance.message,
      'base': instance.base,
      'data': instance.data,
    };
