import 'package:gg_viability/ui/platform/messages/message.dart';

mixin MessagesListener {
  void onError(Message message);

  void onInfo(Message message);

  void onWarning(Message message);
}

class MessagesService {
  final List<MessagesListener> _listeners = [];

  void addListener(MessagesListener listener) {
    print('ADD Message Listener');
    _listeners.add(listener);
  }

  Future<void> fireError(String detail) async {
    final message = Message.error(detail);
    _listeners.forEach((f) => f.onError(message));
  }

  Future<void> infoMessage(String detail) async {
    final message = Message.info(detail);
    _listeners.forEach((f) => f.onError(message));
  }

  void removeListener(MessagesListener listener) {
    print('REMOVE');
    _listeners.remove(listener);
  }
}
