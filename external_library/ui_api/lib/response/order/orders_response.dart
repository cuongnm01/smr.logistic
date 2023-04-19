import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/response/base_response.dart';

import '../../models/order/orders.dart';

part 'orders_response.g.dart';

@JsonSerializable()
class OrdersResponse extends BaseResponse {
  @JsonKey(name: 'data')
  Orders? data;
  OrdersResponse(this.data);

  factory OrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$OrdersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersResponseToJson(this);
}
