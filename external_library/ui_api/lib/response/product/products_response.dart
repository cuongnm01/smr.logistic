import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/response/base_response.dart';

import '../../models/product/product.dart';

part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<Product>? data;
  ProductsResponse(this.data);

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}
