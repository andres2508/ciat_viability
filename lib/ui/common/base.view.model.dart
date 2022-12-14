import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gg_viability/framework/failure.model.dart';
import 'package:gg_viability/infrastructure/locator/service.locator.dart';
import 'package:gg_viability/infrastructure/security/local/authorization.exception.dart';
import 'package:gg_viability/infrastructure/security/session/ciat.session.dart';
import 'package:gg_viability/ui/platform/dialog/dialogs.service.dart';
import 'package:gg_viability/ui/platform/messages/message.dart';

enum NotifierState { initial, loading, loaded }

abstract class BaseViewModel extends ChangeNotifier {
  final DialogsService _messagesService = serviceLocator<DialogsService>();
  NotifierState _state = NotifierState.initial;
  Failure? _failure;

  NotifierState get state => _state;

  Failure? get failure => _failure;

  bool get hasError => failure != null;

  void _setState(NotifierState state) {
    _state = state;
    notifyUI();
  }

  void notifyUI() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void loadStarted() {
    _setState(NotifierState.loading);
  }

  void loadEnded() {
    _setState(NotifierState.loaded);
  }

  void setFailure(Failure failure) {
    _failure = failure;
    notifyUI();
  }

  Future<void> run(Function body) async {
    try {
      loadStarted();
      await body.call();
    } on Exception catch (e) {
      setFailure(Failure.ofException(e));
    } finally {
      loadEnded();
    }
  }

  Future<void> runWithHandlingError(BuildContext context, Function body) async {
    this._messagesService.changeContext(context);
    try {
      loadStarted();
      await body.call();
    } on CIATAuthorizationException {
      await showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: Text("¡Ocurrio un error al validar sesion!"),
              children: [
                SimpleDialogOption(
                  onPressed: () {
                    CIATSession.logout();
                    Navigator.pushNamedAndRemoveUntil(
                        context, 'login', (route) => false);
                  },
                  child: Center(child: Text("Volver al login")),
                )
              ],
            );
          });
    } on Exception catch (error) {
      _messagesService.onError(Message.error(error.toString()));
    } on Failure catch (error) {
      _messagesService.onError(Message.error(error.toString()));
    } finally {
      loadEnded();
    }
  }
}
