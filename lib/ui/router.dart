import 'package:flutter/material.dart';
import 'package:gg_viability/ui/platform/dialog/progress-dialog.widget.dart';
import 'package:gg_viability/ui/platform/router.model.dart';

import 'common/error.widget.dart';

class CIATRouter {
  static Route? currentRoute;
  List<CIATRoute> _appRoutes = [];
  final _errorBuilder = (_) => CIATErrorWidget.of("Ruta desconocida");

  Route<dynamic> generateRoute(RouteSettings settings) {
    final found = _appRoutes.where((it) => it.path == settings.name);
    WidgetBuilder builder = _errorBuilder;
    if (found.isNotEmpty) {
      builder = found.first.component(settings);
    }
    currentRoute = MaterialPageRoute(
      settings: settings,
      builder: (c) {
        return ProgressDialogWrapper(
          builder: builder,
        );
      },
    );
    return currentRoute!;
  }

  void addRoutes(List<CIATRoute> routes) {
    _appRoutes.addAll(routes);
  }
}