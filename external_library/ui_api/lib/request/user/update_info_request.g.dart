// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_info_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateInfoRequest _$UpdateInfoRequestFromJson(Map<String, dynamic> json) =>
    UpdateInfoRequest(
      fullName: json['fullName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$UpdateInfoRequestToJson(UpdateInfoRequest instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'address': instance.address,
    };
