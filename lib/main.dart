import 'package:flutter/cupertino.dart';
import 'package:gg_viability/app.dart';
import 'package:gg_viability/infrastructure/auth/basic_auth.interceptor.dart';
import 'package:gg_viability/infrastructure/http/http.data_source.dart';
import 'package:gg_viability/infrastructure/http/http.interceptor.dart';
import 'package:gg_viability/infrastructure/locator/service.locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  _registerInterceptors();
  runApp(CIATMobileApp());
}

void _registerInterceptors() {
  // Add request interceptors
  HttpInterceptors.addRequestInterceptor(AuthRequestInterceptor());
  HttpInterceptors.addRequestInterceptor(HttpOriginRequestInterceptor());
  // Add response interceptors
  HttpInterceptors.addResponseInterceptor(AuthResponseInterceptor());
}
