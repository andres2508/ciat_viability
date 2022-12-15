// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeanOrder _$BeanOrderFromJson(Map<String, dynamic> json) => BeanOrder(
      (json['content'] as List<dynamic>)
          .map((e) => BeanOrderContent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BeanOrderToJson(BeanOrder instance) => <String, dynamic>{
      'content': instance.content,
    };

BeanOrderContent _$BeanOrderContentFromJson(Map<String, dynamic> json) =>
    BeanOrderContent(
      json['id'] as int,
      json['localNumber'] as String,
      json['intendedUseCode'] as String,
      json['numberOfItems'] as int,
    );

Map<String, dynamic> _$BeanOrderContentToJson(BeanOrderContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'localNumber': instance.localNumber,
      'intendedUseCode': instance.intendedUseCode,
      'numberOfItems': instance.numberOfItems,
    };
