import 'package:gg_viability/infrastructure/auth/basic_auth.model.dart';
import 'package:gg_viability/infrastructure/auth/basic_auth.service.dart';
import 'package:gg_viability/infrastructure/locator/service.locator.dart';
import 'package:gg_viability/infrastructure/security/session/users.model.dart';

final authenticator = CIATAuthenticator();

class CIATAuthenticator {
  final BasicAuthService _authService = serviceLocator<BasicAuthService>();

  Future<User> authenticate(String username, String password) async {
    final BasicAuthResponse authResult =
        await this._authService.authenticate(username, password);
    return Future.value(User.fromAuth(authResult));
  }
}
