import 'package:flutter/material.dart';
import 'package:gg_viability/infrastructure/security/session/ciat.session.dart';
import 'package:gg_viability/styles/color.styles.dart';

class CIATAppBarWidget extends AppBar {
  CIATAppBarWidget({required String title, Key? key})
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
                      Text("USUARIO: ${CIATSession.currentUser!.name}"),
                      _onlineState(),
                      _syncState()
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 80),
                child: Text(title.toUpperCase()),
              )
            ],
          ),
        );

  static Widget _onlineState() {
    // TODO: make model view online state, should be global provider
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              color: ColorStyles.accentColor, shape: BoxShape.circle),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'EN LINEA',
          ),
        ),
      ],
    );
  }

  static Widget _syncState() {
    // TODO: make model view sync state, should be global provider
    return Text('SINCRONIZADO: ${DateTime.now().toString().split(' ')[0]}');
  }
}
