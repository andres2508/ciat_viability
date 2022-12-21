import 'dart:async';

import 'package:gg_viability/ui/common/base.view.model.dart';
import 'package:gg_viability/ui/platform/online/state/online_state.observer.dart';

class OnlineServerStateViewModel extends BaseViewModel {
  final OnlineStateObserver _onlineState = OnlineStateObserver();
  late StreamSubscription<Future<OnlineState>> _subscription;
  late OnlineState _currentState;

  OnlineServerStateViewModel() {
    this._currentState = OnlineState.OFFLINE;
    this._subscription = _onlineState.observer
        .listen((event) => event.then((value) => _validateStatus(value)));
  }

  bool get isOnline => this._currentState == OnlineState.ONLINE;

  void _setToOffline() {
    this._currentState = OnlineState.OFFLINE;
    notifyUI();
    notifyListeners();
  }

  void _setToOnline() {
    this._currentState = OnlineState.ONLINE;
    notifyUI();
    notifyListeners();
  }

  _validateStatus(OnlineState value) {
    switch (value) {
      case OnlineState.ONLINE:
        _setToOnline();
        break;
      case OnlineState.OFFLINE:
        _setToOffline();
        break;
    }
  }

  close() => this._subscription.cancel();
}
