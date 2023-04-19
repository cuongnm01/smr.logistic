import 'package:json_annotation/json_annotation.dart';
import 'package:tiengviet/tiengviet.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  String? id;
  String? code;
  String? name;
  String? description;
  bool? isInsurance;
  String? productCategoryId;
  String? unitId;
  String? productCategoryName;
  String? unitName;

  Product({
    this.id,
    this.code,
    this.name,
    this.description,
    this.isInsurance,
    this.productCategoryId,
    this.productCategoryName,
    this.unitId,
    this.unitName,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  bool isCompare(String searchText) {
    return TiengViet.parse(name ?? '')
        .toLowerCase()
        .contains(TiengViet.parse(searchText).toLowerCase());
  }
}
