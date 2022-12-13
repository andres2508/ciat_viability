// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as String,
      json['name'] as String,
      $enumDecode(_$UserTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$UserTypeEnumMap[instance.type]!,
    };

const _$UserTypeEnumMap = {
  UserType.SENDER: 'SENDER',
  UserType.RECEPTOR: 'RECEPTOR',
};
