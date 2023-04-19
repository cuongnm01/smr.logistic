import 'package:json_annotation/json_annotation.dart';

part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoModel {
  String? id;
  String? userName;
  String? fullName;
  String? phoneNumber;
  String? email;
  String? address;

  UserInfoModel(
      {this.id,
      this.userName,
      this.fullName,
      this.phoneNumber,
      this.email,
      this.address});

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);
}
