import 'dart:async';
import 'dart:convert';

import 'package:gg_viability/framework/failure.model.dart';
import 'package:gg_viability/infrastructure/auth/basic_auth.interceptor.dart';
import 'package:gg_viability/infrastructure/auth/basic_auth.model.dart';
import 'package:gg_viability/infrastructure/configuration/global.configuration.dart';
import 'package:gg_viability/infrastructure/http/http.data_source.dart';
import 'package:http/http.dart';

class BasicAuthService extends HttpDataSource {
  BasicAuthService()
      : super('', authority: GlobalCIATConfiguration.controller.authServer);
  final AuthResponseInterceptor _interceptor = AuthResponseInterceptor();

  Future<BasicAuthResponse> authenticate(String user, String password) async {
    final queryParams = {
      'username': user,
      'password': password,
      'grant_type': 'password'
    };
    Uri uri = this.baseUri(path: "/token", queryParams: queryParams);
    final request = new Request('POST', uri);
    final basicAuth = 'Basic ' +
        base64Encode(
            "${GlobalCIATConfiguration.CLIENT_ID}:${GlobalCIATConfiguration.CLIENT_SECRET}"
                .codeUnits);
    request.headers['Authorization'] = basicAuth;
    try {
      final response = await Response.fromStream(
          await request.send().timeout(Duration(seconds: 31)));
      _interceptor.interceptResponse(response);
      final json = jsonDecode(response.body);
      return Future.value(BasicAuthResponse.fromJson(json));
    } on TimeoutException catch (e) {
      throw Failure.of(
          "¡No se puede establecer conexion con Servidor de Autenticacion! Verifique si tiene conexion a internet");
    }
  }
}
