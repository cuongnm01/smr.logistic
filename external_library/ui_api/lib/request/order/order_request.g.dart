// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderRequest _$OrderRequestFromJson(Map<String, dynamic> json) => OrderRequest(
      code: json['code'] as String?,
      senderName: json['senderName'] as String?,
      senderPhone: json['senderPhone'] as String?,
      senderEmail: json['senderEmail'] as String?,
      senderAddress: json['senderAddress'] as String?,
      senderImage: json['senderImage'] as String?,
      isReceiver: json['isReceiver'] as bool?,
      receiverName: json['receiverName'] as String?,
      receiverPhone: json['receiverPhone'] as String?,
      receiverEmail: json['receiverEmail'] as String?,
      receiverAddress: json['receiverAddress'] as String?,
      receiverImage: json['receiverImage'] as String?,
      receiverPostCode: json['receiverPostCode'] as String?,
      receiverDate: json['receiverDate'] as String?,
      receiverTime: json['receiverTime'] as String?,
      description: json['description'] as String?,
      orderType: json['orderType'] as int?,
      serviceType: json['serviceType'] as int?,
      shippingType: json['shippingType'] as int?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderRequestToJson(OrderRequest instance) =>
    <String, dynamic>{
      'code': instance.code,
      'senderName': instance.senderName,
      'senderPhone': instance.senderPhone,
      'senderEmail': instance.senderEmail,
      'senderAddress': instance.senderAddress,
      'senderImage': instance.senderImage,
      'isReceiver': instance.isReceiver,
      'receiverName': instance.receiverName,
      'receiverPhone': instance.receiverPhone,
      'receiverEmail': instance.receiverEmail,
      'receiverAddress': instance.receiverAddress,
      'receiverImage': instance.receiverImage,
      'receiverPostCode': instance.receiverPostCode,
      'receiverDate': instance.receiverDate,
      'receiverTime': instance.receiverTime,
      'description': instance.description,
      'orderType': instance.orderType,
      'serviceType': instance.serviceType,
      'shippingType': instance.shippingType,
      'products': instance.products,
    };
