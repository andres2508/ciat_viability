import 'dart:io';

import 'package:gg_viability/framework/failure.model.dart';
import 'package:gg_viability/infrastructure/configuration/global.configuration.dart';
import 'package:gg_viability/infrastructure/http/http.interceptor.dart';
import 'package:gg_viability/infrastructure/security/local/authorization.exception.dart';
import 'package:gg_viability/infrastructure/security/session/ciat.session.dart';
import 'package:http/src/request.dart';
import 'package:http/src/response.dart';

class AuthResponseInterceptor implements ResponseInterceptor {
  @override
  void interceptResponse(Response response) {
    if (response.statusCode == HttpStatus.badRequest) {
      if (CIATSession.currentUser != null) {
        throw Failure.of("Ocurrio un error: ${response.body}");
      } else if (response.body.contains('Bad credentials')) {
        throw Failure.of("¡Contraseña invalida o usuario invalido!");
      } else {
        throw new CIATAuthorizationException(
            "¡Error al intentar iniciar sesion!");
      }
    } else if (response.statusCode == HttpStatus.unauthorized) {
      if (CIATSession.currentUser != null) {
        throw Failure.of("¡Usuario no autorizado para actividad!");
      } else {
        throw new CIATAuthorizationException("!Usuario o Contraseña invalidos");
      }
    } else if (response.statusCode > HttpStatus.unauthorized) {
      throw Failure.of("¡Error en el servidor!: Auth: " +
          GlobalCIATConfiguration.controller.authServer +
          ". API: ${GlobalCIATConfiguration.controller.apiServer}" +
          ". Codigo: ${response.statusCode}");
    }
  }
}

class AuthRequestInterceptor implements RequestInterceptor {
  @override
  void interceptRequest(Request request) {
    final userBearer = CIATSession.currentUser;
    if (userBearer != null && !userBearer.isExpire()) {
      request.headers['Authorization'] = "Bearer ${userBearer.accessToken}";
    } else {
      throw new CIATAuthorizationException("Usuario no autenticado");
    }
  }
}
