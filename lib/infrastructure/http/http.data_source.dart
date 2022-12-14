import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:gg_viability/framework/failure.model.dart';
import 'package:gg_viability/infrastructure/configuration/global.configuration.dart';
import 'package:http/http.dart';

typedef S ItemCreator<S>(Map<String, dynamic> json);

class HttpDataSource {
  String _authority;
  final String _basePath;
  final client = HttpClient();

  HttpDataSource(this._basePath, {String? authority})
      : this._authority = authority != null
            ? authority
            : GlobalCIATConfiguration.controller.apiServer {
    client.connectionTimeout = Duration(seconds: 10);
  }

  Uri baseUri({String? path, Map<String, String>? queryParams}) {
    String finalPath = _getPath(path);
    if (_authority.startsWith('http://')) {
      String authorityClear = _authority.replaceAll('http://', '');
      return Uri.http(_getAuthorityClear(authorityClear),
          _extractFinalPath(authorityClear, finalPath), queryParams);
    } else if (_authority.startsWith('https://')) {
      String authorityClear = _authority.replaceAll('https://', '');
      return Uri.https(_getAuthorityClear(authorityClear),
          _extractFinalPath(authorityClear, finalPath), queryParams);
    }
    throw Failure.of('Url invalida $_authority');
  }

  String _getPath(String? path) {
    String finalPath = _basePath;
    if (path != null && _basePath != '') {
      finalPath = '$_basePath/$path';
    } else if (path != null) {
      finalPath = path;
    }
    return finalPath;
  }

  String _getAuthorityClear(String authority) {
    int indexOfAuthorityExtraPath = authority.indexOf('/');
    return indexOfAuthorityExtraPath >= 0
        ? authority.substring(0, indexOfAuthorityExtraPath)
        : authority;
  }

  String _extractFinalPath(String authority, String path) {
    int indexOfAuthorityExtraPath = authority.indexOf('/');
    String head = indexOfAuthorityExtraPath >= 0
        ? authority.substring(indexOfAuthorityExtraPath, authority.length)
        : "";
    return head != "" && head != "/" ? "$head$path" : "$path";
  }

  Future<List<X>> getList<X>(String? path, ItemCreator<X> itemCreator,
      {Map<String, String>? queryParameters}) async {
    Uri uri = baseUri(path: path, queryParams: queryParameters);
    final request = new Request('GET', uri);
    var response = await _executeRequest(request);
    Iterable jsonIterator = jsonDecode(response.body);
    final list = List<X>.from(jsonIterator.map((data) => itemCreator(data)));
    return Future.value(list);
  }

  Future<X> getItem<X>(String? path, ItemCreator<X> itemCreator,
      {Map<String, String>? queryParameters}) async {
    Uri uri = baseUri(path: path, queryParams: queryParameters);
    final request = new Request('GET', uri);
    var response = await _executeRequest(request);
    final json = jsonDecode(response.body);
    final mapped = itemCreator(json);
    return Future.value(mapped);
  }

  Future<Response> _executeRequest(Request request) async {
    try {
      var response = await Response.fromStream(
          await request.send().timeout(Duration(seconds: 20)));
      _checkAndThrowError(response);
      return response;
    } on TimeoutException {
      throw _connectionError();
    }
  }

  void _checkAndThrowError(Response response) {
    if (response.statusCode >= HttpStatus.badRequest) {
      final reason =
          response.reasonPhrase != null ? response.reasonPhrase! : '';
      throw Failure.of('Ocurrió un error procesando la solicitud: $reason');
    }
  }

  Failure _connectionError() {
    return Failure.of('Ocurrio un error realizando la solicitud.'
        ' Verifique que esté conectado a la red e intente de nuevo.');
  }
}
