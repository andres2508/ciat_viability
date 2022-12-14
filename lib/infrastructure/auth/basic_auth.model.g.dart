// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_auth.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicAuthResponse _$BasicAuthResponseFromJson(Map<String, dynamic> json) =>
    BasicAuthResponse(
      json['access_token'] as String,
      json['token_type'] as String,
      json['expires_in'] as int,
      json['scope'] as String,
      json['jti'] as String,
    );

Map<String, dynamic> _$BasicAuthResponseToJson(BasicAuthResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
      'scope': instance.scope,
      'jti': instance.jti,
    };
