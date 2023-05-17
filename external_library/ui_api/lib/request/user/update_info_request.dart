import 'package:json_annotation/json_annotation.dart';

part 'update_info_request.g.dart';

@JsonSerializable()
class UpdateInfoRequest {
  String? fullName;
  String? phoneNumber;
  String? email;
  String? address;

  UpdateInfoRequest({
    this.fullName,
    this.phoneNumber,
    this.email,
    this.address,
  });

  factory UpdateInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateInfoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateInfoRequestToJson(this);
}
