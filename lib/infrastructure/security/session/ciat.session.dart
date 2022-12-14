import 'package:gg_viability/infrastructure/security/session/ciat.authenticator.dart';
import 'package:gg_viability/infrastructure/security/session/users.model.dart';

class CIATSession {
  static User? _currentUser;

  static User? get currentUser => _currentUser;

  static Future<void> loginBasic(String username, String password) async {
    _currentUser = await authenticator.authenticate(username, password);
  }

  static Future<void> logout() async {
    //TODO: implement with authentication server logout
  }
}