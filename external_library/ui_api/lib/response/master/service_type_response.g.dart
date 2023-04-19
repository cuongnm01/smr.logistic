// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_type_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceTypeResponse _$ServiceTypeResponseFromJson(Map<String, dynamic> json) =>
    ServiceTypeResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => ServiceType.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..isSuccess = json['isSuccess'] as bool?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$ServiceTypeResponseToJson(
        ServiceTypeResponse instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'message': instance.message,
      'base': instance.base,
      'data': instance.data,
    };
