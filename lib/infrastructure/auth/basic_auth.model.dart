import 'package:json_annotation/json_annotation.dart';

part 'basic_auth.model.g.dart';

@JsonSerializable()
class BasicAuthResponse {
  @JsonKey(name: 'access_token')
  String accessToken;
  @JsonKey(name: 'token_type')
  String tokenType;
  @JsonKey(name: 'expires_in')
  int expiresIn;
  String scope;
  String jti;

  BasicAuthResponse(
      this.accessToken, this.tokenType, this.expiresIn, this.scope, this.jti);

  Map<String, dynamic> toJson() => _$BasicAuthResponseToJson(this);

  factory BasicAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$BasicAuthResponseFromJson(json);
}
