import 'package:flutter/cupertino.dart';
import 'package:gg_viability/app.dart';
import 'package:gg_viability/infrastructure/locator/service.locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(CIATMobileApp());
}
