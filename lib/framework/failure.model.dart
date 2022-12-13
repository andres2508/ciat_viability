import 'dart:io';

class Failure {
  late String message;

  Failure({required this.message});

  Failure.of(this.message);

  Failure.ofException(Exception e) {
    if (e is SocketException) {
      message = 'Error de conexión. Verifique que tenga acceso a internet';
    }
  }

  @override
  String toString() => message;
}