import 'package:flutter/material.dart';
import 'package:gg_viability/infrastructure/locator/service.locator.dart';
import 'package:gg_viability/infrastructure/security/session/ciat.session.dart';
import 'package:gg_viability/ui/common/base.view.model.dart';
import 'package:gg_viability/ui/platform/dialog/dialogs.service.dart';
import 'package:gg_viability/ui/platform/messages/message.dart';

class LoginViewModel extends BaseViewModel {
  final DialogsService messagesService = serviceLocator<DialogsService>();

  Future<void> login(
      String username, String password, BuildContext context) async {
    await CIATSession.loginBasic(username, password).catchError((error, _) {
      messagesService.onError(Message.error(error.toString()));
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    });
    this.notifyUI();
    this.notifyListeners();
    print(CIATSession.currentUser != null
        ? "Loggin Correct: ${CIATSession.currentUser!.name}"
        : "Bad credentials!!");
    if (CIATSession.currentUser != null) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
    }
  }
}