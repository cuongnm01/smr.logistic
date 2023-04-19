import 'package:json_annotation/json_annotation.dart';

import '../master_data/paging_model.dart';
import 'order.dart';

part 'orders.g.dart';

@JsonSerializable()
class Orders extends PagingModel {
  List<Order>? data;

  Orders({
    this.data,
  });

  factory Orders.fromJson(Map<String, dynamic> json) => _$OrdersFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersToJson(this);
}
