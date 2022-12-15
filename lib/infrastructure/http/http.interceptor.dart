import 'package:gg_viability/infrastructure/configuration/global.configuration.dart';
import 'package:http/http.dart';

mixin RequestInterceptor {
  void interceptRequest(Request request);
}

mixin ResponseInterceptor {
  void interceptResponse(Response response);
}

class HttpOriginRequestInterceptor implements RequestInterceptor {
  @override
  void interceptRequest(Request request) {
    // ToDo: Allowed origins but is neccesary configurable
    request.headers['Origin'] = GlobalCIATConfiguration.controller.apiServer;
  }
}
