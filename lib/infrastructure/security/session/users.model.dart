import 'package:gg_viability/infrastructure/auth/basic_auth.model.dart';
import 'package:jwt_decode/jwt_decode.dart';

class User {
  String? name;
  String? accessToken;
  DateTime? _expirationTime;

  User.fromAuth(BasicAuthResponse authentication) {
    Map<String, dynamic> payload = Jwt.parseJwt(authentication.accessToken);
    this.name = payload['user_name'];
    this.accessToken = authentication.accessToken;
    this._expirationTime = Jwt.getExpiryDate(authentication.accessToken);
  }
}
