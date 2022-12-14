import 'package:http/http.dart';

mixin RequestInterceptor {
  void interceptRequest(Request request);
}

mixin ResponseInterceptor {
  void interceptResponse(Response response);
}
