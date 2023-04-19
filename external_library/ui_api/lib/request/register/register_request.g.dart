// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      json['userName'] as String,
      json['passWord'] as String,
      json['fullName'] as String,
      json['phoneNumber'] as String,
      json['email'] as String,
      json['address'] as String,
      json['dob'] as String,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'passWord': instance.passWord,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'address': instance.address,
      'dob': instance.dob,
    };
