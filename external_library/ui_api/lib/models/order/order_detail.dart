import 'package:json_annotation/json_annotation.dart';

part 'order_detail.g.dart';

@JsonSerializable()
class OrderDetail {
  String? orderId;
  String? productId;
  String? productName;
  bool? isInsurance;
  double? weight;
  double? long;
  double? width;
  double? height;
  double? price;
  String? currency;
  String? description;
  String? categoryId;
  String? id;
  double? temporaryPrice;

  OrderDetail({
    this.orderId,
    this.productId,
    this.productName,
    this.isInsurance,
    this.weight,
    this.long,
    this.width,
    this.height,
    this.price,
    this.currency,
    this.description,
    this.categoryId,
    this.id,
    this.temporaryPrice,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return _$OrderDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderDetailToJson(this);
}
