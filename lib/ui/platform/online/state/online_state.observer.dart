import 'dart:async';
import 'dart:io';

import 'package:gg_viability/infrastructure/configuration/global.configuration.dart';

enum OnlineState { ONLINE, OFFLINE }

class OnlineStateObserver {
  late Stream<Future<OnlineState>> _observer;

  Stream<Future<OnlineState>> get observer => _observer;

  OnlineStateObserver() {
    this._observer = Stream.periodic(Duration(seconds: 5),
        (_) async => await _checkConnectivityWithServer());
  }

  Future<OnlineState> _checkConnectivityWithServer() async {
    try {
      final connectionResult = await InternetAddress.lookup(
          GlobalCIATConfiguration.controller.apiServer);
      if (connectionResult.isNotEmpty &&
          connectionResult[0].rawAddress.isNotEmpty) {
        return Future.value(OnlineState.ONLINE);
      } else {
        return Future.value(OnlineState.OFFLINE);
      }
    } on SocketException catch (_) {
      return Future.value(OnlineState.OFFLINE);
    }
  }
}
