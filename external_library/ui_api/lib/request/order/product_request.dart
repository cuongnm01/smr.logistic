import 'package:json_annotation/json_annotation.dart';

part 'product_request.g.dart';

@JsonSerializable()
class ProductRequest {
  String? productId;
  String? productName;
  double? price;
  String? currency;
  double? weight;
  double? long;
  double? width;
  double? height;
  String? description;
  bool? isInsurance;

  ProductRequest({
    this.productId,
    this.productName,
    this.price,
    this.currency,
    this.weight,
    this.long,
    this.width,
    this.height,
    this.description,
    this.isInsurance,
  });

  factory ProductRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ProductRequestToJson(this);
}
