import 'package:json_annotation/json_annotation.dart';
part 'shipping_type.g.dart';

@JsonSerializable()
class ShippingType {
  int? type;
  String? name;

  ShippingType({this.type, this.name});

  factory ShippingType.fromJson(Map<String, dynamic> json) =>
      _$ShippingTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingTypeToJson(this);
}
