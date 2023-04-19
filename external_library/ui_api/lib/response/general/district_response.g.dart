// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistrictResponse _$DistrictResponseFromJson(Map<String, dynamic> json) =>
    DistrictResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => DistrictsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..isSuccess = json['isSuccess'] as bool?
      ..message = json['message'] as String?
      ..base = json['base'] == null
          ? null
          : BaseVersion.fromJson(json['base'] as Map<String, dynamic>);

Map<String, dynamic> _$DistrictResponseToJson(DistrictResponse instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'message': instance.message,
      'base': instance.base,
      'data': instance.districts,
    };
