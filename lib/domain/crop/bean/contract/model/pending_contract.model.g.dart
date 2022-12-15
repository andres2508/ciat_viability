// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_contract.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeanPendingContract _$BeanPendingContractFromJson(Map<String, dynamic> json) =>
    BeanPendingContract(
      (json['content'] as List<dynamic>)
          .map((e) =>
              BeanPendingContractContent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BeanPendingContractToJson(
        BeanPendingContract instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

BeanPendingContractContent _$BeanPendingContractContentFromJson(
        Map<String, dynamic> json) =>
    BeanPendingContractContent(
      json['id'] as int,
      json['localNumber'] as String,
      json['intendedUseCode'] as String,
      json['numberOfItems'] as int,
    );

Map<String, dynamic> _$BeanPendingContractContentToJson(
        BeanPendingContractContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'localNumber': instance.localNumber,
      'intendedUseCode': instance.intendedUseCode,
      'numberOfItems': instance.numberOfItems,
    };
