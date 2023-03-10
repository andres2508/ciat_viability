import 'package:flutter/material.dart';
import 'package:gg_viability/styles/color.styles.dart';
import 'package:gg_viability/ui/crop/bean/bean.module.dart';
import 'package:gg_viability/ui/login/login.view.model.dart';
import 'package:gg_viability/ui/main.module.dart';
import 'package:gg_viability/ui/platform/ciat.module.dart';
import 'package:gg_viability/ui/platform/online/state/online_state.model.view.dart';
import 'package:gg_viability/ui/router.dart';
import 'package:provider/provider.dart';

List<CIATViewModule> modules = [
  MainModule(),
  BeanModule()];

class CIATMobileApp extends StatefulWidget {
  const CIATMobileApp({Key? key}) : super(key: key);

  @override
  State<CIATMobileApp> createState() => _CIATMobileAppState();
}

class _CIATMobileAppState extends State<CIATMobileApp> {
  final CIATRouter _router = CIATRouter();
  final _theme = ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black54, fontSize: 22),
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      primaryColor: ColorStyles.accentColor,
      primaryColorDark: ColorStyles.accentColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorStyles.accentColor)),
      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 22.0, color: Colors.black54),
        bodyText2: TextStyle(fontSize: 20.0, color: Colors.black54),
        button: TextStyle(fontSize: 18.0, color: ColorStyles.accentColor),
      ));
  final OnlineServerStateViewModel _onlineModel = OnlineServerStateViewModel();

  @override
  void initState() {
    super.initState();
    for (final module in modules) {
      _router.addRoutes(module.routes());
    }
  }

  @override
  void dispose() {
    super.dispose();
    _onlineModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginViewModel>(create: (_) => LoginViewModel()),
        ChangeNotifierProvider<OnlineServerStateViewModel>(
            create: (_) => _onlineModel)
      ],
      child: MaterialApp(
        title: 'CIAT Flutter',
        debugShowCheckedModeBanner: false,
        theme: _theme,
        onGenerateRoute: _router.generateRoute,
        initialRoute: 'login',
      ),
    );
  }
}
