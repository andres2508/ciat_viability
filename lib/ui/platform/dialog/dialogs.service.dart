import 'package:flutter/material.dart';
import 'package:gg_viability/infrastructure/locator/service.locator.dart';
import 'package:gg_viability/ui/platform/messages/message.dart';
import 'package:gg_viability/ui/platform/messages/messages.service.dart';
import 'package:http/http.dart';

class DialogsService
    with MessagesListener {
  BuildContext? _context;
  bool _isProgressVisible = false;
  bool _showProgress = false;

  DialogsService() {
    serviceLocator<MessagesService>().addListener(this);
  }

  @override
  void interceptRequest(Request request) {
    _showProgress = true;
    Future.delayed(Duration(milliseconds: 200), () {
      showProgress();
    });
  }

  void showProgress() {
    if (!_isProgressVisible && _context != null && _showProgress) {
      _isProgressVisible = true;
      showDialog(
        context: _context!,
        builder: (c) => Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }

  @override
  void interceptResponse(Response response) {
    _hideProgress();
  }

  void _hideProgress() {
    _showProgress = false;
    if (_isProgressVisible) {
      _isProgressVisible = false;
      Navigator.pop(_context!);
    }
  }

  void _showDialog(String title, Message msg) {
    _hideProgress();
    showDialog(
      context: _context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg.text),
          actions: <Widget>[
            new TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void onError(Message message) {
    print("ERROR");
    _showDialog('Ocurrió un error', message);
  }

  @override
  void onInfo(Message message) {
    _showDialog('Información', message);
  }

  @override
  void onWarning(Message message) {
    _showDialog('Advertencia', message);
  }

  void changeContext(BuildContext context) {
    _context = context;
  }
}
