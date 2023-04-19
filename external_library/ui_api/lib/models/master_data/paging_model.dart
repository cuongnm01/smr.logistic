import 'package:app/shared/constants/common.dart';
import 'package:json_annotation/json_annotation.dart';
part 'paging_model.g.dart';

@JsonSerializable()
class PagingModel {
  int? totalPaging;
  int? totalRecord;

  PagingModel({this.totalPaging, this.totalRecord});

  factory PagingModel.fromJson(Map<String, dynamic> json) =>
      _$PagingModelFromJson(json);

  Map<String, dynamic> toJson() => _$PagingModelToJson(this);

}
