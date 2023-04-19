import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/response/base_response.dart';

import '../../models/order/order.dart';

part 'order_response.g.dart';

@JsonSerializable()
class OrderResponse extends BaseResponse {
  @JsonKey(name: 'data')
  Order? data;
  OrderResponse(this.data);

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);
}
