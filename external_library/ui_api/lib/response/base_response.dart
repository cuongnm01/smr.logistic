import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  bool? isSuccess;
  String? message;
  BaseVersion? base;

  BaseResponse({this.isSuccess, this.message, this.base});

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}

@JsonSerializable()
class BaseVersion {
  int? version;
  String? updatedAt;

  BaseVersion({this.version, this.updatedAt});

  factory BaseVersion.fromJson(Map<String, dynamic> json) =>
      _$BaseVersionFromJson(json);
  Map<String, dynamic> toJson() => _$BaseVersionToJson(this);
}
