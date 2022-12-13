import 'package:flutter/material.dart';

typedef WidgetFactory = WidgetBuilder Function(RouteSettings settings);

class CIATRoute {
  String path;
  WidgetFactory component;

  CIATRoute(this.path, this.component);
}