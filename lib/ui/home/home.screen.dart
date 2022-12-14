import 'package:flutter/material.dart';
import 'package:gg_viability/infrastructure/security/session/ciat.session.dart';
import 'package:gg_viability/styles/color.styles.dart';
import 'package:gg_viability/ui/home/drawer.menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              child: Text('CULTIVO PARA EVALUAR'),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: CIATMenuWidget(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text(
              'Seleccione el cultivo a evaluar',
              style: TextStyle(color: ColorStyles.accentColor, fontSize: 26),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _optionWidget('Frijol'.toUpperCase(),
                    () => Navigator.pushNamed(context, 'beans/pendings')),
                SizedBox(width: 30),
                _optionWidget('Forrajes'.toUpperCase(),
                    () => Navigator.pushNamed(context, 'forage/pendings')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _optionWidget(String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 200,
        child: Center(
            child: Text( title,
              style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white ),
          textAlign: TextAlign.center,
        )),
        decoration: BoxDecoration(
            color: ColorStyles.darkColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }

  Widget _onlineState() {
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

  Widget _syncState() {
    // TODO: make model view sync state, should be global provider
    return Text('SINCRONIZADO: ${DateTime.now().toString().split(' ')[0]}');
  }
}
