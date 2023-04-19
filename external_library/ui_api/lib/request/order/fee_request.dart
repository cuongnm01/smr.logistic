import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/request/order/product_request.dart';

part 'fee_request.g.dart';

@JsonSerializable()
class FeeRequest {
  int? serviceType;
  int? shippingType;
  List<ProductRequest>? products;

  FeeRequest({
    this.serviceType,
    this.shippingType,
    this.products,
  });

  factory FeeRequest.fromJson(Map<String, dynamic> json) =>
      _$FeeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FeeRequestToJson(this);
}
