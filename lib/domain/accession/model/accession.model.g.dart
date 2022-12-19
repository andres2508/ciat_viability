// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accession.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Accession _$AccessionFromJson(Map<String, dynamic> json) => Accession(
      json['id'] as int,
      json['accessionNumber'] as String,
      json['preferredName'] as String,
    );

Map<String, dynamic> _$AccessionToJson(Accession instance) => <String, dynamic>{
      'id': instance.id,
      'accessionNumber': instance.accessionNumber,
      'preferredName': instance.preferredName,
    };
