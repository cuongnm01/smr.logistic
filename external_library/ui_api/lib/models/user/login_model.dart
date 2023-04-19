import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/models/user/user_info_model.dart';
part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  String? token;
  UserInfoModel? userInfo;

  LoginModel({this.token, this.userInfo});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
