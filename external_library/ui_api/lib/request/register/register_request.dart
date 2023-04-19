import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  final String userName;
  final String passWord;
  final String fullName;
  final String phoneNumber;
  final String email;
  final String address;
  final String dob;

  RegisterRequest(
    this.userName,
    this.passWord,
    this.fullName,
    this.phoneNumber,
    this.email,
    this.address,
    this.dob,
  );

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
