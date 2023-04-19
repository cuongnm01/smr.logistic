import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/response/base_response.dart';

import '../../models/master_data/shipping_type.dart';

part 'shipping_type_response.g.dart';

@JsonSerializable()
class ShippingTypeResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<ShippingType>? data;

  ShippingTypeResponse(this.data);

  factory ShippingTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$ShippingTypeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingTypeResponseToJson(this);
}
