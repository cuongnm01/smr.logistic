import 'package:json_annotation/json_annotation.dart';

import '../master_data/paging_model.dart';
import 'category.dart';
part 'categories.g.dart';

@JsonSerializable()
class Categories extends PagingModel {
  List<Category>? data;

  Categories({
    this.data,
  });

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}
