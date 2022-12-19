// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_request.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderRequest _$OrderRequestFromJson(Map<String, dynamic> json) => OrderRequest(
      (json['content'] as List<dynamic>)
          .map((e) => OrderRequestItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderRequestToJson(OrderRequest instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

OrderRequestItem _$OrderRequestItemFromJson(Map<String, dynamic> json) =>
    OrderRequestItem(
      json['id'] as int,
      (json['quantityShipped'] as num?)?.toDouble(),
      json['orderRequestId'] as int,
      Inventory.fromJson(json['inventory'] as Map<String, dynamic>),
      json['confirmed'] as bool? ?? false,
    );

Map<String, dynamic> _$OrderRequestItemToJson(OrderRequestItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantityShipped': instance.quantityShipped,
      'orderRequestId': instance.orderRequestId,
      'inventory': instance.inventory,
      'confirmed': instance.confirmed,
    };
