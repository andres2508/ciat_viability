import 'package:gg_viability/ui/home/home.screen.dart';
import 'package:gg_viability/ui/login/login.screen.dart';
import 'package:gg_viability/ui/platform/ciat.module.dart';
import 'package:gg_viability/ui/platform/router.model.dart';

class MainModule extends CIATViewModule {
  @override
  List<CIATRoute> routes() {
    return [
      CIATRoute('login', (s) => (_) => LoginScreen()),
      CIATRoute('home', (s) => (_) => HomeScreen())
    ];
  }

}