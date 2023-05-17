// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'changepass_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePassRequest _$ChangePassRequestFromJson(Map<String, dynamic> json) =>
    ChangePassRequest(
      json['currentPassword'] as String,
      json['newPassword'] as String,
    );

Map<String, dynamic> _$ChangePassRequestToJson(ChangePassRequest instance) =>
    <String, dynamic>{
      'currentPassword': instance.currentPassword,
      'newPassword': instance.newPassword,
    };
