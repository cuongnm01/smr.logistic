import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/request/order/product_request.dart';

part 'order_request.g.dart';

@JsonSerializable()
class OrderRequest {
  String? code;
  String? senderName;
  String? senderPhone;
  String? senderEmail;
  String? senderAddress;
  String? senderImage;
  bool? isReceiver;
  String? receiverName;
  String? receiverPhone;
  String? receiverEmail;
  String? receiverAddress;
  String? receiverImage;
  String? receiverPostCode;
  String? receiverDate;
  String? receiverTime;
  String? description;
  int? orderType;
  int? serviceType;
  int? shippingType;
  List<ProductRequest>? products;

  OrderRequest(
      {this.code,
      this.senderName,
      this.senderPhone,
      this.senderEmail,
      this.senderAddress,
      this.senderImage,
      this.isReceiver,
      this.receiverName,
      this.receiverPhone,
      this.receiverEmail,
      this.receiverAddress,
      this.receiverImage,
      this.receiverPostCode,
      this.receiverDate,
      this.receiverTime,
      this.description,
      this.orderType,
      this.serviceType,
      this.shippingType,
      this.products});

  factory OrderRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OrderRequestToJson(this);
}
