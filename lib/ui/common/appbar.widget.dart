import 'package:flutter/material.dart';
import 'package:gg_viability/infrastructure/security/session/ciat.session.dart';
import 'package:gg_viability/styles/color.styles.dart';
import 'package:gg_viability/ui/common/view.model.consumer.dart';
import 'package:gg_viability/ui/platform/online/state/online_state.model.view.dart';

class CIATAppBarWidget extends AppBar {
  CIATAppBarWidget({required String title, bool isLoginView = false, Key? key})
      : super(
          toolbarHeight: 90,
          iconTheme: IconThemeData(color: ColorStyles.accentColor),
          centerTitle: true,
          title: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      !isLoginView
                          ? Text("USUARIO: ${CIATSession.currentUser!.name}")
                          : Container(),
                      _onlineState(),
                      _syncState()
                    ],
                  ),
                ),
              ),
              !isLoginView
                  ? Padding(
                      padding: const EdgeInsets.only(top: 10, right: 80),
                      child: Text(title.toUpperCase()),
                    )
                  : Container()
            ],
          ),
        );

  static Widget _onlineState() {
    return ViewModelConsumer<OnlineServerStateViewModel>(
        builder: (context, model, _) {
      return Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                color: model.isOnline ? ColorStyles.accentColor : Colors.red,
                shape: BoxShape.circle),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              model.isOnline ? 'EN LINEA' : 'SIN CONEXION',
            ),
          ),
        ],
      );
    });
  }

  static Widget _syncState() {
    // TODO: make model view sync state, should be global provider
    return Text('SINCRONIZADO: ${DateTime.now().toString().split(' ')[0]}');
  }
}
