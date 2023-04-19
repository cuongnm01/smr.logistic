import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/response/base_response.dart';

import '../../models/product/fee.dart';

part 'fee_response.g.dart';

@JsonSerializable()
class FeeResponse extends BaseResponse {
  @JsonKey(name: 'data')
  Fee? data;
  FeeResponse(this.data);

  factory FeeResponse.fromJson(Map<String, dynamic> json) =>
      _$FeeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FeeResponseToJson(this);
}
