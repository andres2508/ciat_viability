import 'package:gg_viability/ui/user/users.model.dart';

class CIATSession {
  static User? _currentUser;

  static User? get currentUser => _currentUser;

  static void setCurrentUser(User user) {
    CIATSession._currentUser = user;
  }
}