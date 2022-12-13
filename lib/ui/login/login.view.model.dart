import 'package:gg_viability/infrastructure/security/session/ciat.session.dart';
import 'package:gg_viability/ui/common/base.view.model.dart';
import 'package:gg_viability/ui/user/users.model.dart';

class LoginViewModel extends BaseViewModel {
  List<User> _users = [];

  List<User> get users => this._users;
  User get currentUser => this.currentUser!;

  Future<void> loadUsers() async {
    notifyUI();
    notifyListeners();
  }

  void setCurrentUser(String userId) {
    CIATSession.setCurrentUser( _users.firstWhere((element) => element.id == userId) );
  }
}