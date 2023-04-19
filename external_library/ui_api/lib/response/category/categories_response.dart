import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/response/base_response.dart';

import '../../models/category/categories.dart';

part 'categories_response.g.dart';

@JsonSerializable()
class CategoriesResponse extends BaseResponse {
  @JsonKey(name: 'data')
  Categories? data;
  CategoriesResponse(this.data);

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesResponseToJson(this);
}
