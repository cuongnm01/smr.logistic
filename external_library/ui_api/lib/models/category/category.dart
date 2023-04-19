import 'package:json_annotation/json_annotation.dart';
import 'package:tiengviet/tiengviet.dart';
part 'category.g.dart';

@JsonSerializable()
class Category {
  String? id;
  String? code;
  String? name;
  String? description;

  Category({
    this.id,
    this.code,
    this.name,
    this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  bool isCompare(String searchText) {
    return TiengViet.parse(name ?? '')
        .toLowerCase()
        .contains(TiengViet.parse(searchText).toLowerCase());
  }
}
