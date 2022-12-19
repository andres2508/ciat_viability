// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Inventory _$InventoryFromJson(Map<String, dynamic> json) => Inventory(
      json['id'] as int,
      json['inventoryNumberPart1'] as String,
      Accession.fromJson(json['accession'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InventoryToJson(Inventory instance) => <String, dynamic>{
      'id': instance.id,
      'inventoryNumberPart1': instance.inventoryNumberPart1,
      'accession': instance.accession,
    };
