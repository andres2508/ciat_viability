import 'package:flutter/material.dart';
import 'package:gg_viability/infrastructure/locator/service.locator.dart';
import 'package:gg_viability/ui/platform/dialog/dialogs.service.dart';

class ProgressDialogWrapper extends StatelessWidget {
  final WidgetBuilder builder;

  ProgressDialogWrapper({required this.builder});

  @override
  Widget build(BuildContext context) {
    serviceLocator<DialogsService>().changeContext(context);
    return builder(context);
  }
}
