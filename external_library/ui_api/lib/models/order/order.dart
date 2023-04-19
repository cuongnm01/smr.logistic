import 'package:json_annotation/json_annotation.dart';

import 'order_detail.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  String? id;
  String? code;
  int? orderType;
  int? serviceType;
  int? shippingType;
  String? senderName;
  String? senderPhone;
  String? senderAddress;
  String? senderEmail;
  bool? isReceiver;
  String? receiverName;
  String? receiverPhone;
  String? receiverAddress;
  String? receiverEmail;
  String? receiverPostCode;
  int? statusId;
  String? status;
  double? temporaryPrice;
  String? description;
  DateTime? createdDate;
  List<OrderDetail>? orderDetails;

  Order({
    this.id,
    this.code,
    this.orderType,
    this.serviceType,
    this.shippingType,
    this.senderName,
    this.senderPhone,
    this.senderAddress,
    this.senderEmail,
    this.isReceiver,
    this.receiverName,
    this.receiverPhone,
    this.receiverAddress,
    this.receiverEmail,
    this.receiverPostCode,
    this.statusId,
    this.status,
    this.temporaryPrice,
    this.description,
    this.createdDate,
    this.orderDetails,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
