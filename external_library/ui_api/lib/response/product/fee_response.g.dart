// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fee_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeeResponse _$FeeResponseFromJson(Map<String, dynamic> json) => FeeResponse(
      json['data'] == null
          ? null
          : Fee.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..isSuccess = json['isSuccess'] as bool?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$FeeResponseToJson(FeeResponse instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'message': instance.message,
      'base': instance.base,
      'data': instance.data,
    };
