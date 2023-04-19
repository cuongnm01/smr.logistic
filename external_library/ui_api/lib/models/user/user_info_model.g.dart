// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    UserInfoModel(
      id: json['id'] as String?,
      userName: json['userName'] as String?,
      fullName: json['fullName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'address': instance.address,
    };
