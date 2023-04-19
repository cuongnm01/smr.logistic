// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      token: json['token'] as String?,
      userInfo: json['userInfo'] == null
          ? null
          : UserInfoModel.fromJson(json['userInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'userInfo': instance.userInfo,
    };
