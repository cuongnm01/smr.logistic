import 'package:json_annotation/json_annotation.dart';

part 'changepass_request.g.dart';

@JsonSerializable()
class ChangePassRequest {
  String currentPassword;
  String newPassword;

  ChangePassRequest(this.currentPassword, this.newPassword);

  factory ChangePassRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePassRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePassRequestToJson(this);
}
