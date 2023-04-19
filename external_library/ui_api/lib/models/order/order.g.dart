// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['id'] as String?,
      code: json['code'] as String?,
      orderType: json['orderType'] as int?,
      serviceType: json['serviceType'] as int?,
      shippingType: json['shippingType'] as int?,
      senderName: json['senderName'] as String?,
      senderPhone: json['senderPhone'] as String?,
      senderAddress: json['senderAddress'] as String?,
      senderEmail: json['senderEmail'] as String?,
      isReceiver: json['isReceiver'] as bool?,
      receiverName: json['receiverName'] as String?,
      receiverPhone: json['receiverPhone'] as String?,
      receiverAddress: json['receiverAddress'] as String?,
      receiverEmail: json['receiverEmail'] as String?,
      receiverPostCode: json['receiverPostCode'] as String?,
      statusId: json['statusId'] as int?,
      status: json['status'] as String?,
      temporaryPrice: (json['temporaryPrice'] as num?)?.toDouble(),
      description: json['description'] as String?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      orderDetails: (json['orderDetails'] as List<dynamic>?)
          ?.map((e) => OrderDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'orderType': instance.orderType,
      'serviceType': instance.serviceType,
      'shippingType': instance.shippingType,
      'senderName': instance.senderName,
      'senderPhone': instance.senderPhone,
      'senderAddress': instance.senderAddress,
      'senderEmail': instance.senderEmail,
      'isReceiver': instance.isReceiver,
      'receiverName': instance.receiverName,
      'receiverPhone': instance.receiverPhone,
      'receiverAddress': instance.receiverAddress,
      'receiverEmail': instance.receiverEmail,
      'receiverPostCode': instance.receiverPostCode,
      'statusId': instance.statusId,
      'status': instance.status,
      'temporaryPrice': instance.temporaryPrice,
      'description': instance.description,
      'createdDate': instance.createdDate?.toIso8601String(),
      'orderDetails': instance.orderDetails,
    };
